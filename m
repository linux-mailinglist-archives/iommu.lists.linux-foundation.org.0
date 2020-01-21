Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 925131434D7
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 01:45:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 01F3E2047C;
	Tue, 21 Jan 2020 00:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ppAngQ9Ixif; Tue, 21 Jan 2020 00:45:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E42402047E;
	Tue, 21 Jan 2020 00:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA3F2C0174;
	Tue, 21 Jan 2020 00:45:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C784FC0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 00:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0D1986072
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 00:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znu-ou9NTCtF for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 00:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3086C855E1
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 00:45:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 16:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,343,1574150400"; d="scan'208";a="215371656"
Received: from allen-box.sh.intel.com (HELO [10.239.159.138])
 ([10.239.159.138])
 by orsmga007.jf.intel.com with ESMTP; 20 Jan 2020 16:45:20 -0800
Subject: Re: [RFC PATCH 0/4] iommu: Per-group default domain type
To: John Garry <john.garry@huawei.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20200101052648.14295-1-baolu.lu@linux.intel.com>
 <ba7a7e6a-8b23-fca0-a8bb-72c4dbfa8390@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f417cd0b-1bf7-7da2-3a64-b8b74b03da02@linux.intel.com>
Date: Tue, 21 Jan 2020 08:43:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ba7a7e6a-8b23-fca0-a8bb-72c4dbfa8390@huawei.com>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi John,

On 1/20/20 5:44 PM, John Garry wrote:
> On 01/01/2020 05:26, Lu Baolu wrote:
>> An IOMMU group represents the smallest set of devices that are considered
>> to be isolated. All devices belonging to an IOMMU group share a default
>> domain for DMA APIs. There are two types of default domain: 
>> IOMMU_DOMAIN_DMA
>> and IOMMU_DOMAIN_IDENTITY. The former means IOMMU translation, while the
>> latter means IOMMU by-pass.
>>
>> Currently, the default domain type for the IOMMU groups is determined
>> globally. All IOMMU groups use a single default domain type. The global
>> default domain type can be adjusted by kernel build configuration or
>> kernel parameters.
>>
>> More and more users are looking forward to a fine grained default domain
>> type. For example, with the global default domain type set to 
>> translation,
>> the OEM verndors or end users might want some trusted and fast-speed 
>> devices
>> to bypass IOMMU for performance gains. On the other hand, with global
>> default domain type set to by-pass, some devices with limited system
>> memory addressing capability might want IOMMU translation to remove the
>> bounce buffer overhead.
> 
> Hi Lu Baolu,
> 
> Do you think that it would be a more common usecase to want 
> kernel-managed devices to be passthrough for performance reasons and 
> some select devices to be in DMA domain, like those with limited address 
> cap or whose drivers request huge amounts of memory?
> 
> I just think it would be more manageable to set kernel commandline 
> parameters for this, i.e. those select few which want DMA domain.
>

It's just two sides of a coin. Currently, iommu subsystem make DMA
domain by default, that's the reason why I selected to let user set
which devices are willing to use identity domains.


> Thanks,
> John

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
