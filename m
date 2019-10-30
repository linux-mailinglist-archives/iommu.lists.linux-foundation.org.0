Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B0E9F2D
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 16:36:03 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 735C4E8D;
	Wed, 30 Oct 2019 15:35:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C352D8C
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AF1AB63D
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:35:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE0A1FB;
	Wed, 30 Oct 2019 08:35:57 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F03D3F6C4;
	Wed, 30 Oct 2019 08:35:56 -0700 (PDT)
Subject: Re: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
To: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
References: <20191030145112.19738-1-will@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6e457227-ca06-2998-4ffa-a58ab171ce32@arm.com>
Date: Wed, 30 Oct 2019 15:35:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191030145112.19738-1-will@kernel.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
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

On 30/10/2019 14:51, Will Deacon wrote:
> Hi all,
> 
> As part of the work to enable a "Generic Kernel Image" across multiple
> Android devices, there is a need to seperate shared, core kernel code
> from modular driver code that may not be needed by all SoCs. This means
> building IOMMU drivers as modules.
> 
> It turns out that most of the groundwork has already been done to enable
> the ARM SMMU drivers to be 'tristate' options in drivers/iommu/Kconfig;
> with a few symbols exported from the IOMMU/PCI core, everything builds
> nicely out of the box. The one exception is support for the legacy SMMU
> DT binding, which is not in widespread use and has never worked with
> modules, so we can simply remove that when building as a module rather
> than try to paper over it with even more hacks.
> 
> Obviously you need to be careful about using IOMMU drivers as modules,
> since late loading of the driver for an IOMMU serving active DMA masters
> is going to end badly in many cases. On Android, we're using device links
> to ensure that the IOMMU probes first.

Out of curiosity, which device links are those? Clearly not the RPM 
links created by the IOMMU drivers themselves... Is this some special 
Android magic, or is there actually a chance of replacing all the 
of_iommu_configure() machinery with something more generic?

Robin.

> 
> Comments welcome,
> 
> Will
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> 
> --->8
> 
> Will Deacon (7):
>    drivers/iommu: Export core IOMMU API symbols to permit modular drivers
>    iommu/of: Request ACS from the PCI core when configuring IOMMU linkage
>    PCI: Export pci_ats_disabled() as a GPL symbol to modules
>    Revert "iommu/arm-smmu: Make arm-smmu-v3 explicitly non-modular"
>    iommu/arm-smmu-v3: Allow building as a module
>    Revert "iommu/arm-smmu: Make arm-smmu explicitly non-modular"
>    iommu/arm-smmu: Allow building as a module
> 
>   drivers/iommu/Kconfig         | 16 ++++++-
>   drivers/iommu/arm-smmu-impl.c |  6 +++
>   drivers/iommu/arm-smmu-v3.c   | 26 +++++++----
>   drivers/iommu/arm-smmu.c      | 86 +++++++++++++++++++++--------------
>   drivers/iommu/iommu-sysfs.c   |  5 ++
>   drivers/iommu/iommu.c         |  8 ++++
>   drivers/iommu/of_iommu.c      |  1 +
>   drivers/pci/pci.c             |  1 +
>   8 files changed, 102 insertions(+), 47 deletions(-)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
