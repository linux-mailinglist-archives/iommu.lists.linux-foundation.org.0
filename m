Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42045A3D28
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 19:46:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5AAD4633C;
	Fri, 30 Aug 2019 17:46:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFE176335
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 17:45:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 785D5EC
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 17:45:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 170BF337;
	Fri, 30 Aug 2019 10:45:42 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719A83F718;
	Fri, 30 Aug 2019 10:45:37 -0700 (PDT)
Subject: Re: [PATCH 6/7] arm64: tegra: Add DT node for T194 SMMU
To: Krishna Reddy <vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
	<1567118827-26358-7-git-send-email-vdumpa@nvidia.com>
	<b834ceb2-b296-0a52-c913-5a8923466cf2@arm.com>
	<BYAPR12MB2710BDF98FA472A77D106814B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <da30773d-5831-7cc6-4d82-b304d9b8a29b@arm.com>
Date: Fri, 30 Aug 2019 18:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2710BDF98FA472A77D106814B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Timo Alho <talho@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Pritesh Raithatha <praithatha@nvidia.com>,
	"Thomas Zeng \(SW-TEGRA\)" <thomasz@nvidia.com>,
	Sachin Nikam <Snikam@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Yu-Huan Hsu <YHsu@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>,
	Alexander Van Brunt <avanbrunt@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 30/08/2019 18:25, Krishna Reddy wrote:
>>> +		#global-interrupts = <1>;
> 
>> Shouldn't that be 3?
> 
> Interrupt line is shared between global and all context faults for each SMMU instance.
> Nvidia implementation checks for both Global and context faults on each interrupt to an SMMU instance.
> It can be either 1 or 3.  If we make it 3, we need to add two more irq entries in node for context faults.

The number of global interrupts has never been related to the number of 
context interrupts :/

> In the future, we can update arm-smmu.c to support shared interrupt line between global and all context faults.

Clearly you have one combined interrupt output per SMMU - describing 
those as one global interrupt and the first two context bank interrupts 
respectively makes far less sense than calling them 3 global interrupts, 
not least because the latter is strictly true. Yes, the binding prevents 
us from describing the context bank interrupts for more than one 
instance, but at that point the fact that it *is* the combined output 
saves us - because the driver is aware of this specific integration it 
knows it can just register the "secondary" global interrupts as 
"secondary" context interrupts too. If we had separate IRQ lines per 
context bank per instance, then we'd have a really big problem and might 
have to redefine the binding, but as it is it happens to work out pretty 
neatly.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
