Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 456634DD8B2
	for <lists.iommu@lfdr.de>; Fri, 18 Mar 2022 12:07:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF8A847A6;
	Fri, 18 Mar 2022 11:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpFtzuZST0uR; Fri, 18 Mar 2022 11:07:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F1167847A7;
	Fri, 18 Mar 2022 11:07:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB75BC0082;
	Fri, 18 Mar 2022 11:07:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E5E6C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 11:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB41401E1
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 11:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGpQqRTJRWKC for <iommu@lists.linux-foundation.org>;
 Fri, 18 Mar 2022 11:07:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 037E740156
 for <iommu@lists.linux-foundation.org>; Fri, 18 Mar 2022 11:07:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F60E16F2;
 Fri, 18 Mar 2022 04:07:44 -0700 (PDT)
Received: from [10.57.43.230] (unknown [10.57.43.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C4E3F7F5;
 Fri, 18 Mar 2022 04:07:40 -0700 (PDT)
Message-ID: <249e5876-f8c6-0236-16fa-a611a9f9e0b2@arm.com>
Date: Fri, 18 Mar 2022 11:07:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4 RESEND] dma-mapping: Add wrapper function to set
 dma_coherent
Content-Language: en-GB
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <1647534311-2349-1-git-send-email-mikelley@microsoft.com>
 <1647534311-2349-3-git-send-email-mikelley@microsoft.com>
 <d480c8ea-f047-2854-b1cf-041475b451db@arm.com>
 <PH0PR21MB30252951848A6328E11385A4D7129@PH0PR21MB3025.namprd21.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <PH0PR21MB30252951848A6328E11385A4D7129@PH0PR21MB3025.namprd21.prod.outlook.com>
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

On 2022-03-17 19:13, Michael Kelley (LINUX) wrote:
> From: Robin Murphy <robin.murphy@arm.com> Sent: Thursday, March 17, 2022 10:20 AM
>>
>> On 2022-03-17 16:25, Michael Kelley via iommu wrote:
>>> Add a wrapper function to set dma_coherent, avoiding the need for
>>> complex #ifdef's when setting it in architecture independent code.
>>
>> No. It might happen to work out on the architectures you're looking at,
>> but if Hyper-V were ever to support, say, AArch32 VMs you might see the
>> problem. arch_setup_dma_ops() is the tool for this job.
>>
> 
> OK.   There's currently no vIOMMU in a Hyper-V guest, so presumably the
> code would call arch_setup_dma_ops() with the dma_base, size, and iommu
> parameters set to 0 and NULL.  This call can then be used in Patch 3 instead
> of acpi_dma_configure(), and in the Patch 4 hv_dma_configure() function
> as you suggested.  arch_setup_dma_ops() is not exported, so I'd need to
> wrap it in a Hyper-V specific function in built-in code that is exported.
> 
> But at some point in the future if there's a vIOMMU in Hyper-V guests,
> this approach will need some rework.
> 
> Does that make sense?  Thanks for your input and suggestions ...

Yes, that's essentially what I had in mind. If you did present a vIOMMU 
to the guest, presumably you'd either have to construct a regular 
IORT/VIOT, and thus end up adding the root complex to the ACPI namespace 
too so it can be referenced, at which point it would all get picked up 
by the standard machinery, or come up with some magic VMBus mechanism 
that would need a whole load of work to wire up in all the relevant 
places anyway.

(But please lean extremely heavily towards the former option!)

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
