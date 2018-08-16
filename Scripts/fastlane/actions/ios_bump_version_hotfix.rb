module Fastlane
  module Actions
    class IosBumpVersionHotfixAction < Action
      def self.run(params)
        UI.message "Bumping app release version for hotfix..."
        
        require_relative '../helpers/ios_git_helper.rb'
        Fastlane::Helpers::IosGitHelper.branch_for_hotfix(params[:previous_version], params[:version])
        Fastlane::Helpers::IosGitHelper.bump_version_hotfix(params[:version])
        
        UI.message "Done."
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Bumps the version of the app and creates the new release branch"
      end

      def self.details
        "Bumps the version of the app and creates the new release branch"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :version,
                                       env_name: "FL_IOS_BUMP_VERSION_HOTFIX_VERSION", 
                                       description: "The version of the hotfix", 
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :previous_version,
                                       env_name: "FL_IOS_BUMP_VERSION_HOTFIX_PREVIOUS_VERSION",
                                       description: "The version to branch from",
                                       is_string: true) # the default value if the user didn't provide one
        ]
      end

      def self.output
        
      end

      def self.return_value
        
      end

      def self.authors
        ["loremattei"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
