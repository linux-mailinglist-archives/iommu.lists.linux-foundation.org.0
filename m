Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989ED8252
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 23:40:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D391EBE4;
	Tue, 15 Oct 2019 21:40:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E142ACD
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 21:40:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D7AF66C5
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 21:40:05 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6F82C20873;
	Tue, 15 Oct 2019 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571175605;
	bh=rzxeYVHxaGJYYBmftcCSuQhrVoYG1vLxx7KotPMBfGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=R+dzhpIm9d+5tXXHT7JSZskm8mpDniLP13W+EJICbgVv7VIAKXKJ8NARbs2xsjqWn
	+vILcC/jnRTHPyJjow+FmYMqlEU/RdjVqVsPHOrqAnZDxLZLSm7SFKcM8YQ4J3VmFW
	AgeRdUxa9ythv6td9cPbSppRdCKhl6aAxjdZzNn0=
Date: Tue, 15 Oct 2019 16:40:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 0/2] iommu/vt-d: Select PCI_PRI for INTEL_IOMMU_SVM
Message-ID: <20191015214003.GA178213@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009224551.179497-1-helgaas@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,RCVD_IN_DNSWL_HI autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org
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

[+cc Jerry]

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
> 
> The second patch moves pci_prg_resp_pasid_required(), which simply returns
> a bit from the PCI capability, from #ifdef CONFIG_PCI_PASID to #ifdef
> CONFIG_PCI_PRI.  This is related because INTEL_IOMMU_SVM already *does*
> select PCI_PASID, so it previously always got pci_prg_resp_pasid_required()
> even though it got stubs for other PRI things.
> 
> Since these are related and I have several follow-on ATS-related patches in
> the queue, I'd like to take these both via the PCI tree.
> 
> Bjorn Helgaas (2):
>   iommu/vt-d: Select PCI_PRI for INTEL_IOMMU_SVM
>   PCI/ATS: Move pci_prg_resp_pasid_required() to CONFIG_PCI_PRI
> 
>  drivers/iommu/Kconfig   |  1 +
>  drivers/pci/ats.c       | 55 +++++++++++++++++++----------------------
>  include/linux/pci-ats.h | 11 ++++-----
>  3 files changed, 31 insertions(+), 36 deletions(-)

I applied these to pci/virtualization for v5.5 with Kuppuswamy's
and Joerg's Reviewed-by on both and Jerry's on the first.  Thank you
all for checking this over!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
