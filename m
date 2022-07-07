Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D842569E6E
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 11:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46E940C8F;
	Thu,  7 Jul 2022 09:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B46E940C8F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NGZe7soY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMS6FtQwhnvP; Thu,  7 Jul 2022 09:18:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 90F3A40C7B;
	Thu,  7 Jul 2022 09:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F3A40C7B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D6E1C007D;
	Thu,  7 Jul 2022 09:18:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0636C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 09:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42046419E2
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 09:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42046419E2
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=NGZe7soY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXv5BhCyL6e0 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 09:18:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4219C419E0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4219C419E0
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657185489; x=1688721489;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BUxVY3iStR4ugijNmMBdAZwPF0rqfSTjbUNrFsBmpe8=;
 b=NGZe7soYXdoc3fIHeqST4FbwT1MLlJFxyou/7vK9IIt0KTSxR336nu4F
 4ajg9PEA+gRzDCNVj+pQ+dcA1I8Xrii1ZT2nQnGB6Xgqiq2/KB/v6Y1Bz
 voXWB3IZ/DWDNAnts14BFYEKPNCqrqk8Wu5JqxuRDH/BKisGb8+fV+VEq
 3k1y68D0BIA4WMaZEbjTw9VgLwsVMaGVOL3Je8lI3bctJuNXSHYcrHIcA
 bToDaq8xIz9x7UJPOpmf53ZX5fxAxsZx7OsZb9YmAlaAYQqC3xju9Ka8Y
 ocbIlNKQGLsNtyfI7707LgNTr9UxGPD/3okq/sxjfDzvjvTeVaM/u855s g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284718001"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="284718001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 02:18:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="651058747"
Received: from hualiu-mobl1.ccr.corp.intel.com (HELO [10.249.171.209])
 ([10.249.171.209])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 02:18:06 -0700
Message-ID: <93f60759-ab1c-7506-161f-2cd07e184dda@linux.intel.com>
Date: Thu, 7 Jul 2022 17:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 01/11] iommu/vt-d: debugfs: Remove device_domain_lock
 usage
Content-Language: en-US
To: Ethan Zhao <haifeng.zhao@linux.intel.com>,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev
References: <20220706025524.2904370-1-baolu.lu@linux.intel.com>
 <20220706025524.2904370-2-baolu.lu@linux.intel.com>
 <849557ab-9c1b-a2ff-6fc6-6564f38d1187@linux.intel.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <849557ab-9c1b-a2ff-6fc6-6564f38d1187@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, Jacob jun Pan <jacob.jun.pan@intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022/7/7 16:30, Ethan Zhao wrote:
>> -static int show_device_domain_translation(struct device *dev, void *data)
>> +static int __show_device_domain_translation(struct device *dev, void *data)
>>   {
>> -	struct device_domain_info *info = dev_iommu_priv_get(dev);
>> -	struct dmar_domain *domain = info->domain;
>> +	struct dmar_domain *domain;
>>   	struct seq_file *m = data;
>>   	u64 path[6] = { 0 };
>>   
>> +	domain = to_dmar_domain(iommu_get_domain_for_dev(dev));
>>   	if (!domain)
>>   		return 0;
>>   
>> @@ -359,20 +359,39 @@ static int show_device_domain_translation(struct device *dev, void *data)
>>   	pgtable_walk_level(m, domain->pgd, domain->agaw + 2, 0, path);
>>   	seq_putc(m, '\n');
>>   
>> -	return 0;
>> +	/* Don't iterate */
>> +	return 1;
>>   }
> 
> Using this return value trick to change the caller behaviour, seems not 
> saving
> 
> anything, but really cost me a few seconds more to know the 
> *incantation* --
> 
> 'Don't iterate' :) .

This is defined by iommu_group_for_each_dev(). Return value 0 means
continuing to next one, while non-zero means stopping iteration.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
