class About < ApplicationRecord
  belongs_to :user,required: false
end


=begin
"user"=>
         {"personal_data_attributes"=>{"name"=>"Daniel",
                                       "age"=>"28",
                                       "cnh"=>"",
                                       "email"=>""},
          "phones_attributes"=>{"0"=>{"phone_user"=>"",
                                      "_destroy"=>"false"}},
          "idioms_attributes"=>{"0"=>{"language_idiom"=>"",
                                      "_destroy"=>"false"}},
          "instituitions_attributes"=>{"0"=>{"name_instituition"=>"",
                                             "graduation"=>"",
                                             "course"=>"",
                                             "start_year_grad"=>"",
                                             "exit_year_grad"=>""}},
          "jobs_attributes"=>{"0"=>{"employer"=>"",
                                    "office"=>"",
                                    "start_year_job"=>"",
                                    "exit_year_job"=>""}},
          "complementary_trainnings_attributes"=>{"0"=>{"name_instituition_comp"=>"",
                                                        "course_comp"=>"", "workload"=>""}},
          "about_attributes"=>{"resume"=>"",
                               "objective"=>""}},
        "button"=>""}
=end
