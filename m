Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF610A635
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 22:50:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C59368815F;
	Tue, 26 Nov 2019 21:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFlZr4Uc8sdZ; Tue, 26 Nov 2019 21:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 324C388146;
	Tue, 26 Nov 2019 21:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03F71C1DE5;
	Tue, 26 Nov 2019 21:50:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9510AC0881
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 21:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F3EC855F6
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 21:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzD53eq0Y7Yl for <iommu@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 21:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC31B84FDD
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 21:50:23 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A4D32064B;
 Tue, 26 Nov 2019 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574805023;
 bh=fviU4DYleNx/9leEWr8KlLRaZcRV5/31mbcIkscLwXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uUIlGVPyKOrvuHVpQv/b+ruVHCQDTlDu1+qzEemw7EkSDCS8/n4JPZHteVMdX0WFZ
 91sGaPq8CDozUc+9UqG1loem0V7LuABz1cFlkueEdKM8Bnyqsc6Xkrw3oMKIRDoyoo
 AdKDLXRSe79ve81TcXBrMFWSSipAW0nQkoXOLgX0=
Date: Tue, 26 Nov 2019 15:50:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v3 0/7] Raspberry Pi 4 PCIe support
Message-ID: <20191126215020.GA191414@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126091946.7970-1-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 linux-rockchip@lists.infradead.org, linux-rdma@vger.kernel.org, maz@kernel.org,
 phil@raspberrypi.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 mbrugger@suse.com, bcm-kernel-feedback-list@broadcom.com, wahrenst@gmx.net,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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

On Tue, Nov 26, 2019 at 10:19:38AM +0100, Nicolas Saenz Julienne wrote:
> This series aims at providing support for Raspberry Pi 4's PCIe
> controller, which is also shared with the Broadcom STB family of
> devices.

> Jim Quinlan (3):
>   dt-bindings: PCI: Add bindings for brcmstb's PCIe device
>   PCI: brcmstb: add Broadcom STB PCIe host controller driver
>   PCI: brcmstb: add MSI capability

Please update these subjects to match the others, i.e., capitalize
"Add".  Also, I think "Add MSI capability" really means "Add support
for MSI ..."; in PCIe terms the "MSI Capability" is a structure in
config space and it's there whether the OS supports it or not.

No need to repost just for this.

> Nicolas Saenz Julienne (4):
>   linux/log2.h: Add roundup/rounddown_pow_two64() family of functions
>   ARM: dts: bcm2711: Enable PCIe controller
>   MAINTAINERS: Add brcmstb PCIe controller
>   arm64: defconfig: Enable Broadcom's STB PCIe controller
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
