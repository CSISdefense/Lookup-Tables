USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[FAADS](
	[unique_transaction_id] [varchar](32) NULL,
	[transaction_status] [varchar](6) NULL,
	[fyq] [varchar](9) NULL,
	[cfda_program_num] [varchar](6) NULL,
	[sai_number] [varchar](32) NULL,
	[account_title] [varchar](100) NULL,
	[recipient_name] [nvarchar](150) NULL,
	[recipient_city_code] [varchar](5) NULL,
	[recipient_city_name] [varchar](50) NULL,
	[recipient_county_code] [varchar](4) NULL,
	[recipient_county_name] [varchar](50) NULL,
	[recipient_zip] [varchar](12) NULL,
	[recipient_type] [smallint] NOT NULL,
	[action_type] [varchar](8) NULL,
	[agency_code] [varchar](4) NULL,
	[federal_award_id] [varchar](16) NULL,
	[federal_award_mod] [varchar](4) NULL,
	[fed_funding_amount] [decimal](19, 4) NULL,
	[non_fed_funding_amount] [decimal](19, 4) NULL,
	[total_funding_amount] [decimal](19, 4) NULL,
	[obligation_action_date] [date] NULL,
	[starting_date] [date] NULL,
	[ending_date] [date] NULL,
	[assistance_type] [varchar](2) NULL,
	[record_type] [varchar](1) NULL,
	[correction_late_ind] [varchar](16) NULL,
	[fyq_correction] [bigint] NULL,
	[principal_place_code] [varchar](7) NULL,
	[principal_place_state] [varchar](50) NULL,
	[principal_place_cc] [varchar](50) NULL,
	[principal_place_zip] [bigint] NULL,
	[principal_place_cd] [varchar](4) NULL,
	[cfda_program_title] [varchar](255) NULL,
	[agency_name] [varchar](100) NULL,
	[project_description] [varchar](300) NULL,
	[duns_no] [varchar](13) NULL,
	[duns_conf_code] [varchar](2) NULL,
	[progsrc_agen_code] [varchar](2) NULL,
	[progsrc_acnt_code] [varchar](4) NULL,
	[progsrc_subacnt_code] [varchar](4) NULL,
	[receip_addr1] [varchar](50) NULL,
	[receip_addr2] [varchar](50) NULL,
	[receip_addr3] [varchar](50) NULL,
	[face_loan_guran] [decimal](19, 4) NULL,
	[orig_sub_guran] [decimal](19, 4) NULL,
	[fiscal_year] [bigint] NULL,
	[principal_place_state_code] [varchar](2) NULL,
	[recip_cat_type] [varchar](1) NULL,
	[asst_cat_type] [varchar](1) NULL,
	[recipient_cd] [varchar](4) NULL,
	[maj_agency_cat] [varchar](4) NULL,
	[rec_flag] [varchar](3) NULL,
	[recipient_country_code] [varchar](3) NULL,
	[uri] [varchar](100) NULL,
	[recipient_state_code] [varchar](2) NULL,
	[CSISCreatedDate] [datetime] NULL,
	[CSISModifiedDate] [datetime] NULL,
	[principal_place_non_zip] [varchar](12) NULL,
	[CSISawardIDmod] [bigint] NULL,
	[CSISfaadsTransactionID] [bigint] IDENTITY(1,1) NOT NULL,
	[exec1_fullname] [varchar](100) NULL,
	[exec1_amount] [decimal](19, 4) NULL,
	[exec2_fullname] [varchar](100) NULL,
	[exec2_amount] [decimal](19, 4) NULL,
	[exec3_fullname] [varchar](100) NULL,
	[exec3_amount] [decimal](19, 4) NULL,
	[exec4_fullname] [varchar](100) NULL,
	[exec4_amount] [decimal](19, 4) NULL,
	[exec5_fullname] [varchar](100) NULL,
	[exec5_amount] [decimal](19, 4) NULL,
	[last_modified_date] [datetime2](7) NULL,
	[principal_place_country_code] [varchar](3) NULL
) ON [PRIMARY]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] ADD  CONSTRAINT [DF_GrantOrLoan_USAspending_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] ADD  CONSTRAINT [DF_GrantOrLoan_USASpending_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_Assistance_action_type] FOREIGN KEY([action_type])
REFERENCES [Assistance].[action_type] ([action_type])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_Assistance_action_type]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_Assistance_assistance_type] FOREIGN KEY([assistance_type])
REFERENCES [Assistance].[assistance_type] ([assistance_type])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_Assistance_assistance_type]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_Assistance_correction_late_ind] FOREIGN KEY([correction_late_ind])
REFERENCES [Assistance].[correction_late_ind] ([correction_late_ind])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_Assistance_correction_late_ind]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [fk_assistance_faads_recipient_type] FOREIGN KEY([recipient_type])
REFERENCES [Vendor].[recipient_type] ([recipient_type])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [fk_assistance_faads_recipient_type]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_Assistance_record_type] FOREIGN KEY([record_type])
REFERENCES [Assistance].[record_type] ([record_type])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_Assistance_record_type]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [fk_Contractor_Duns_no] FOREIGN KEY([duns_no])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [fk_Contractor_Duns_no]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_FAADS_recipient_name] FOREIGN KEY([recipient_name])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_FAADS_recipient_name]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDStypetable_agency_code] FOREIGN KEY([agency_code])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_FPDStypetable_agency_code]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDStypetable_maj_agency_cat] FOREIGN KEY([maj_agency_cat])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_FPDStypetable_maj_agency_cat]
GO
ALTER TABLE [GrantLoanAssistance].[FAADS]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendor_recip_cat_type] FOREIGN KEY([recip_cat_type])
REFERENCES [Vendor].[recip_cat_type] ([recip_cat_type])
GO
ALTER TABLE [GrantLoanAssistance].[FAADS] CHECK CONSTRAINT [FK_Vendor_recip_cat_type]
GO
