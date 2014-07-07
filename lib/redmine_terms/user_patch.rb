module RedmineTerms
 module UserPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
       unloadable
     alias_method :logged?,:logged_with_ext?
           attr_accessible :status_tc
      end
    end
    module ClassMethods
    end
    module InstanceMethods
     def logged_with_ext?
        if status_tc.nil? || !status_tc
           return false
        else
           return true
        end
      end
    end
 end
end
