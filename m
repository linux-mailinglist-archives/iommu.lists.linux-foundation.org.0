Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F7128067
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 17:13:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBF768881C;
	Fri, 20 Dec 2019 16:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znL1GuMWtQNX; Fri, 20 Dec 2019 16:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7805886E5;
	Fri, 20 Dec 2019 16:13:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98681C077D;
	Fri, 20 Dec 2019 16:13:23 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4821DC077D
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 16:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3ECF08800D
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 16:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JG+41rW60FcQ for <iommu@lists.linuxfoundation.org>;
 Fri, 20 Dec 2019 16:13:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9FF1488007
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 16:13:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B7E12495; Fri, 20 Dec 2019 17:13:16 +0100 (CET)
Date: Fri, 20 Dec 2019 17:13:13 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 00/16] iommu: Permit modular builds of ARM SMMU[v3]
 drivers
Message-ID: <20191220161313.GA21234@8bytes.org>
References: <20191219120352.382-1-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219120352.382-1-will@kernel.org>
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

On Thu, Dec 19, 2019 at 12:03:36PM +0000, Will Deacon wrote:
> Ard Biesheuvel (1):
>   iommu/arm-smmu: Support SMMU module probing from the IORT
> 
> Greg Kroah-Hartman (1):
>   PCI/ATS: Restore EXPORT_SYMBOL_GPL() for pci_{enable,disable}_ats()
> 
> Will Deacon (14):
>   drivers/iommu: Export core IOMMU API symbols to permit modular drivers
>   iommu/of: Request ACS from the PCI core when configuring IOMMU linkage
>   PCI: Export pci_ats_disabled() as a GPL symbol to modules
>   drivers/iommu: Take a ref to the IOMMU driver prior to ->add_device()
>   iommu/of: Take a ref to the IOMMU driver during ->of_xlate()
>   drivers/iommu: Allow IOMMU bus ops to be unregistered
>   Revert "iommu/arm-smmu: Make arm-smmu-v3 explicitly non-modular"
>   Revert "iommu/arm-smmu: Make arm-smmu explicitly non-modular"
>   iommu/arm-smmu: Prevent forced unbinding of Arm SMMU drivers
>   iommu/arm-smmu-v3: Unregister IOMMU and bus ops on device removal
>   iommu/arm-smmu-v3: Allow building as a module
>   iommu/arm-smmu: Unregister IOMMU and bus ops on device removal
>   iommu/arm-smmu: Allow building as a module
>   iommu/arm-smmu: Update my email address in MODULE_AUTHOR()
> 
>  drivers/acpi/arm64/iort.c   |   4 +-
>  drivers/iommu/Kconfig       |  16 ++++-
>  drivers/iommu/Makefile      |   3 +-
>  drivers/iommu/arm-smmu-v3.c |  94 +++++++++++++++++---------
>  drivers/iommu/arm-smmu.c    | 128 +++++++++++++++++++++++++-----------
>  drivers/iommu/iommu-sysfs.c |   5 ++
>  drivers/iommu/iommu.c       |  32 ++++++++-
>  drivers/iommu/of_iommu.c    |  19 ++++--
>  drivers/pci/ats.c           |   2 +
>  drivers/pci/pci.c           |   1 +
>  include/linux/iommu.h       |   4 +-
>  11 files changed, 223 insertions(+), 85 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
