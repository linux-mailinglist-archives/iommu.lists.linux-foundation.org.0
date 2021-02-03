Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3B30D05F
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 01:42:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 110A2204EB;
	Wed,  3 Feb 2021 00:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adywee+7wOZ1; Wed,  3 Feb 2021 00:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 29676204E8;
	Wed,  3 Feb 2021 00:42:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CFFAC013A;
	Wed,  3 Feb 2021 00:42:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A449C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41058204C3
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpcvlfOa4zFX for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 00:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id E3619203CF
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:42:23 +0000 (UTC)
IronPort-SDR: L/P4xJNM1OcFBlr70STk+4MSZJwYnEEwnccjjTwJ1rKfI6TQ0kJfTTiquSgm7+NRXwWWfgv9k0
 bDTh6nB7UwNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199900227"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="199900227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 16:42:23 -0800
IronPort-SDR: MMKNBch+1mmOdmWJTo+x57VCujaG3b48l/M96+PWoodyq4a31cr3LEkCDmFuMiT5MNDd7vIzh7
 hekzoLknfkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="406362278"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2021 16:42:22 -0800
Subject: Re: [PATCH 3/3] iommu/vt-d: Apply SATC policy
To: Joerg Roedel <joro@8bytes.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-4-baolu.lu@linux.intel.com>
 <20210202135501.GX32671@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <698a0a53-d0f4-cee2-03d7-4e914276737e@linux.intel.com>
Date: Wed, 3 Feb 2021 08:33:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202135501.GX32671@8bytes.org>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org
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

On 2/2/21 9:55 PM, Joerg Roedel wrote:
> On Tue, Feb 02, 2021 at 12:40:57PM +0800, Lu Baolu wrote:
>> +	list_for_each_entry_rcu(satcu, &dmar_satc_units, list) {
>> +		satc = container_of(satcu->hdr, struct acpi_dmar_satc, header);
>> +		if (satc->segment == pci_domain_nr(dev->bus) && satcu->atc_required) {
> 
> You can safe a level of indentation and make this look nicer if you do:
> 
> 		if (satc->segment != pci_domain_nr(dev->bus) || !satcu->atc_required)
> 			continue;
> 
> 

Yes. Thanks!

Best regards,
baolu

>> +			for_each_dev_scope(satcu->devices, satcu->devices_cnt, i, tmp)
>> +				if (to_pci_dev(tmp) == dev)
>> +					goto out;
>> +		}
>> +	}
>> +	ret = 0;
>> +out:
>> +	rcu_read_unlock();
>> +	return ret;
>> +}
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
