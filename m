Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C851310C3
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 11:49:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 054862050A;
	Mon,  6 Jan 2020 10:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0onQe0Cn9Cl; Mon,  6 Jan 2020 10:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4E1D1204E1;
	Mon,  6 Jan 2020 10:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38F42C0881;
	Mon,  6 Jan 2020 10:49:02 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA9FCC0881
 for <iommu@lists.linuxfoundation.org>; Mon,  6 Jan 2020 10:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B32E085198
 for <iommu@lists.linuxfoundation.org>; Mon,  6 Jan 2020 10:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zC_dLHpCIuch for <iommu@lists.linuxfoundation.org>;
 Mon,  6 Jan 2020 10:49:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 416A384BBE
 for <iommu@lists.linuxfoundation.org>; Mon,  6 Jan 2020 10:49:00 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CFCA2075A;
 Mon,  6 Jan 2020 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578307740;
 bh=KTf4Q6TMAmFP4YypppQIz+5yyzzXgPCq9NldOVTUXr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U51UUbcinc7Ku/DCDqj1MSpIsTMSmgc6k3QIbXCjTMa1HyQuVTvmINCGcrlZj7I+c
 WPV/TptbljByMQJSMd6nbmsYL8s7X/klNzDoSCfF9q36ZVGXpP6mLN1BVJQJfvOf1N
 ksMBt95Wj8aKEdygIqt3ipkKqNBrFvfOZ6TdMCj8=
Date: Mon, 6 Jan 2020 10:48:54 +0000
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 00/16] iommu: Permit modular builds of ARM SMMU[v3]
 drivers
Message-ID: <20200106104853.GA5400@willie-the-truck>
References: <20191219120352.382-1-will@kernel.org>
 <20191220161313.GA21234@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220161313.GA21234@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linuxfoundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 kernel-team@android.com, "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Dec 20, 2019 at 05:13:13PM +0100, Joerg Roedel wrote:
> On Thu, Dec 19, 2019 at 12:03:36PM +0000, Will Deacon wrote:
> > Ard Biesheuvel (1):
> >   iommu/arm-smmu: Support SMMU module probing from the IORT
> > 
> > Greg Kroah-Hartman (1):
> >   PCI/ATS: Restore EXPORT_SYMBOL_GPL() for pci_{enable,disable}_ats()
> > 
> > Will Deacon (14):
> >   drivers/iommu: Export core IOMMU API symbols to permit modular drivers
> >   iommu/of: Request ACS from the PCI core when configuring IOMMU linkage
> >   PCI: Export pci_ats_disabled() as a GPL symbol to modules
> >   drivers/iommu: Take a ref to the IOMMU driver prior to ->add_device()
> >   iommu/of: Take a ref to the IOMMU driver during ->of_xlate()
> >   drivers/iommu: Allow IOMMU bus ops to be unregistered
> >   Revert "iommu/arm-smmu: Make arm-smmu-v3 explicitly non-modular"
> >   Revert "iommu/arm-smmu: Make arm-smmu explicitly non-modular"
> >   iommu/arm-smmu: Prevent forced unbinding of Arm SMMU drivers
> >   iommu/arm-smmu-v3: Unregister IOMMU and bus ops on device removal
> >   iommu/arm-smmu-v3: Allow building as a module
> >   iommu/arm-smmu: Unregister IOMMU and bus ops on device removal
> >   iommu/arm-smmu: Allow building as a module
> >   iommu/arm-smmu: Update my email address in MODULE_AUTHOR()
> > 
> >  drivers/acpi/arm64/iort.c   |   4 +-
> >  drivers/iommu/Kconfig       |  16 ++++-
> >  drivers/iommu/Makefile      |   3 +-
> >  drivers/iommu/arm-smmu-v3.c |  94 +++++++++++++++++---------
> >  drivers/iommu/arm-smmu.c    | 128 +++++++++++++++++++++++++-----------
> >  drivers/iommu/iommu-sysfs.c |   5 ++
> >  drivers/iommu/iommu.c       |  32 ++++++++-
> >  drivers/iommu/of_iommu.c    |  19 ++++--
> >  drivers/pci/ats.c           |   2 +
> >  drivers/pci/pci.c           |   1 +
> >  include/linux/iommu.h       |   4 +-
> >  11 files changed, 223 insertions(+), 85 deletions(-)
> 
> Applied, thanks.

Thanks, Joerg! I'll look into the suggestion from Greg regarding 'automatic'
setting of the module 'owner' field and send a follow-up patch if I come up
with something.

Will

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
