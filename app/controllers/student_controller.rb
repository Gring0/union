class StudentController < ApplicationController

  def index
    require 'open-uri'

    url = "https://eu.bmstu.ru/modules/contingent/service/xml/students/?view=oldschool"
    query = { :fio => "Фуксман", :group => "ИУ5-85",  :card_number => "09У282"}
    response = open(url+"&"+query.to_param('search'), :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
    response = response.read.force_encoding("UTF-8")

    # пример возвращаемого результата
    # response = File.new('/Users/fuksman/union/public/bmstu.xml')

    contingent = Hash.from_xml(response)
    student = contingent["contingent"]["students"]["student"]
    uuid = student["uuid"].to_s
    name = student["lastName"].to_s+" "+student["firstName"].to_s+" "+student["middleName"].to_s
    academy_group = student["group"]["titleshort"]
    study_type =  student["studyType"]["name"]
    state =  student["studentState"]["name"]
    @student_info = {
        :uuid => uuid,
        :name => name,
        :academy_group => academy_group,
        :study_type => study_type,
        :state => state
    }

  end
end
