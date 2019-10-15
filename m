Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF6D756D
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:46:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 531CBCB5;
	Tue, 15 Oct 2019 11:46:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E71E0CA4
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:46:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 714B16C5
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:46:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id AC4752D9; Tue, 15 Oct 2019 13:46:43 +0200 (CEST)
Date: Tue, 15 Oct 2019 13:46:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/2] iommu/vt-d: Select PCI_PRI for INTEL_IOMMU_SVM
Message-ID: <20191015114642.GL14518@8bytes.org>
References: <20191009224551.179497-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009224551.179497-1-helgaas@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hey Bjorn,

On Wed, Oct 09, 2019 at 05:45:49PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> I think intel-iommu.c depends on CONFIG_AMD_IOMMU in an undesirable way:
> 
> When CONFIG_INTEL_IOMMU_SVM=y, iommu_enable_dev_iotlb() calls PRI
> interfaces (pci_reset_pri() and pci_enable_pri()), but those are only
> implemented when CONFIG_PCI_PRI is enabled.  If CONFIG_PCI_PRI is not
> enabled, there are stubs that just return failure.
> 
> The INTEL_IOMMU_SVM Kconfig does nothing with PCI_PRI, but AMD_IOMMU
> selects PCI_PRI.  So if AMD_IOMMU is enabled, intel-iommu.c gets the full
> PRI interfaces.  If AMD_IOMMU is not enabled, it gets the PRI stubs.
> 
> This seems wrong.  The first patch here makes INTEL_IOMMU_SVM select
> PCI_PRI so intel-iommu.c always gets the full PRI interfaces.

Indeed, this is very wrong, thanks for fixing it. Feel free to apply
this series to your tree with my:

Reviewed-by: Joerg Roedel <jroedel@suse.de>
Acked-by: Joerg Roedel <jroedel@suse.de>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
