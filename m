Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B840231056
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 19:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1450A20429;
	Tue, 28 Jul 2020 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNGd4ty3TIvq; Tue, 28 Jul 2020 17:01:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E81E5203A4;
	Tue, 28 Jul 2020 17:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D047BC004D;
	Tue, 28 Jul 2020 17:01:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81D65C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AAF8859C2
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 17:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObuXoPnyCi-o for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 17:01:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D158F859BD
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6971C2053B;
 Tue, 28 Jul 2020 17:01:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v2 00/12] ACPI/OF: Upgrade MSI/IOMMU ID mapping APIs
Date: Tue, 28 Jul 2020 18:01:33 +0100
Message-Id: <159595564192.31263.3059824977932788766.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, Makarand Pawagi <makarand.pawagi@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Diana Craciun <diana.craciun@oss.nxp.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
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

On Fri, 19 Jun 2020 09:20:01 +0100, Lorenzo Pieralisi wrote:
> This series is a v2 of a previous posting:
> 
> v1 -> v2
> 
> - Removed _rid() wrappers
> - Fixed !CONFIG_ACPI compilation issue
> - Converted of_pci_iommu_init() to use of_iommu_configure_dev_id()
> 
> [...]

Applied to arm64 (for-next/msi-iommu), thanks!

[01/12] ACPI/IORT: Make iort_match_node_callback walk the ACPI namespace for NC
        https://git.kernel.org/arm64/c/07d2e59f27cd
[02/12] ACPI/IORT: Make iort_get_device_domain IRQ domain agnostic
        https://git.kernel.org/arm64/c/d1718a1b7a86
[03/12] ACPI/IORT: Make iort_msi_map_rid() PCI agnostic
        https://git.kernel.org/arm64/c/39c3cf566cea
[04/12] ACPI/IORT: Remove useless PCI bus walk
        https://git.kernel.org/arm64/c/3a3d208beede
[05/12] ACPI/IORT: Add an input ID to acpi_dma_configure()
        https://git.kernel.org/arm64/c/b8e069a2a8da
[06/12] of/iommu: Make of_map_rid() PCI agnostic
        https://git.kernel.org/arm64/c/746a71d02b5d
[07/12] of/device: Add input id to of_dma_configure()
        https://git.kernel.org/arm64/c/a081bd4af4ce
[08/12] dt-bindings: arm: fsl: Add msi-map device-tree binding for fsl-mc bus
        https://git.kernel.org/arm64/c/5bda70c6162d
[09/12] of/irq: make of_msi_map_get_device_domain() bus agnostic
        https://git.kernel.org/arm64/c/6f881aba0110
[10/12] of/irq: Make of_msi_map_rid() PCI bus agnostic
        https://git.kernel.org/arm64/c/2bcdd8f2c07f
[11/12] bus/fsl-mc: Refactor the MSI domain creation in the DPRC driver
        https://git.kernel.org/arm64/c/998fb7badf03
[12/12] bus: fsl-mc: Add ACPI support for fsl-mc
        https://git.kernel.org/arm64/c/6305166c8771

-- 
Catalin

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
