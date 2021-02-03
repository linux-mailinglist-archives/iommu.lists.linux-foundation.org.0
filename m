Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3330D038
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 01:19:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B26785078;
	Wed,  3 Feb 2021 00:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85LkW6EpOG7v; Wed,  3 Feb 2021 00:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F27C84F5A;
	Wed,  3 Feb 2021 00:19:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F937C013A;
	Wed,  3 Feb 2021 00:19:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72ABFC013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6628384789
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THSTMdwS-qLK for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 00:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EBA3D84785
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:19:29 +0000 (UTC)
IronPort-SDR: +hhLWziYULn2W6PtZeGHtrOeUVMdXj5MDal81bcf3ufKu276q1j417dLwJmg4/UWsI0NNxTKQ0
 dnW190BG/kIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="180182333"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="180182333"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 16:19:28 -0800
IronPort-SDR: W5OFdWgXT0fIAnC/qdqVNgv32OuvqM3kS8gWPtpomchprrc/CG1wu8rqMfdIqdFV64JNO1zbkw
 XnzLAWpwh/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="406357196"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2021 16:19:27 -0800
Subject: Re: [PATCH 1/3] iommu/vt-d: Add new enum value and structure for SATC
To: Joerg Roedel <joro@8bytes.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-2-baolu.lu@linux.intel.com>
 <20210202135130.GV32671@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1dcd57e4-f2b3-d300-c6fe-7b6c6b41cb82@linux.intel.com>
Date: Wed, 3 Feb 2021 08:11:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202135130.GV32671@8bytes.org>
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

Hi Joerg,

On 2/2/21 9:51 PM, Joerg Roedel wrote:
> Hi Baolu,
> 
> On Tue, Feb 02, 2021 at 12:40:55PM +0800, Lu Baolu wrote:
>> @@ -514,7 +514,8 @@ enum acpi_dmar_type {
>>   	ACPI_DMAR_TYPE_ROOT_ATS = 2,
>>   	ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,
>>   	ACPI_DMAR_TYPE_NAMESPACE = 4,
>> -	ACPI_DMAR_TYPE_RESERVED = 5	/* 5 and greater are reserved */
>> +	ACPI_DMAR_TYPE_SATC = 5,
>> +	ACPI_DMAR_TYPE_RESERVED = 6	/* 5 and greater are reserved */
> 
> Nit: The comment needs to be updated too.
> 

Yes. Will update it.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
