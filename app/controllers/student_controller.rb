#config:utf8
class StudentController < ApplicationController

  def index

  end

  def search
    require 'open-uri'

    url = 'https://eu.bmstu.ru/modules/contingent/service/xml/students/'
    view_type = '?view=oldschool&'
    query = {
        'fio' => params[:fio],
        'group' => params[:group],
        'card_number' => params[:card_number]
    }

    uri = url+view_type+query.to_param('search')
    response = open(uri, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE, :read_timeout => 10)
    response = response.read.force_encoding("UTF-8")

    #response = File.open('/Users/fuksman/union/public/bmstu.xml')

    @contingent = Hash.from_xml(response)
    if !@contingent.has_key?('contingent')
    elsif !@contingent['contingent'].has_key?('students') or !@contingent['contingent']['students'].has_key?('student') or @contingent['contingent']['students']['student'].length!=1
    end

    if @contingent.has_key?("contingent")
      if @contingent["contingent"].has_key?("students")
        if @contingent["contingent"]["students"].has_key?("student")
          if @contingent["contingent"]["students"]["student"].class == Hash
            student = @contingent["contingent"]["students"]["student"]
            uuid = student["uuid"].to_s
            name = student["lastName"].to_s+" "+student["firstName"].to_s+" "+student["middleName"].to_s
            card_number = student["cardNumber"]
            academy_group = student["group"]["titleshort"]
            study_type =  student["studyType"]["name"]
            state =  student["studentState"]["name"]
            @student_info = {
                :id => current_user.id,
                :uuid => uuid,
                :name => name,
                :card_number => card_number,
                :academy_group => academy_group,
                :enabled => (study_type == "Бюджетная" and state == "Обучается"),
            }
          else
            redirect_to student_index_path
            flash[:error] = "В «Электронном Университете» найдено больше одного студента. Уточните, пожалуйста, параметры поиска."
          end
        else
          redirect_to student_index_path
          flash[:error] = "Информация в «Электронном Университете» не найдена. Уточните, пожалуйста, параметры поиска."
        end
      else
        redirect_to student_index_path
        flash[:error] = "Информация в «Электронном Университете» не найдена. Уточните, пожалуйста, параметры поиска."
      end
    else
      redirect_to student_index_path
      flash[:error] = "Проблемы с «Электронным Университетом». Пожалуйста, попробуйте повторить операцию позже."
    end
  end

end
