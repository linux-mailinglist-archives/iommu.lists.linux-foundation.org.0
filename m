Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B423D1CF8
	for <lists.iommu@lfdr.de>; Thu, 10 Oct 2019 01:44:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59060E1A;
	Wed,  9 Oct 2019 23:44:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DBF0DC3
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 23:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D29CF14D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 23:44:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2019 16:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="193027202"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2019 16:44:00 -0700
Received: from [10.54.74.33] (skuppusw-desk.jf.intel.com [10.54.74.33])
	by linux.intel.com (Postfix) with ESMTP id EEC7E5802BC;
	Wed,  9 Oct 2019 16:43:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu/vt-d: Select PCI_PRI for INTEL_IOMMU_SVM
To: Bjorn Helgaas <helgaas@kernel.org>, David Woodhouse
	<dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
References: <20191009224551.179497-1-helgaas@kernel.org>
	<20191009224551.179497-2-helgaas@kernel.org>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel
Message-ID: <76ec2ac0-129e-ef65-8229-6405020fdc9f@linux.intel.com>
Date: Wed, 9 Oct 2019 16:42:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009224551.179497-2-helgaas@kernel.org>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>
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
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


On 10/9/19 3:45 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> When CONFIG_INTEL_IOMMU_SVM=y, iommu_enable_dev_iotlb() calls PRI
> interfaces (pci_reset_pri() and pci_enable_pri()), but those are only
> implemented when CONFIG_PCI_PRI is enabled.
>
> Previously INTEL_IOMMU_SVM selected PCI_PASID but not PCI_PRI, so the state
> of PCI_PRI depended on whether AMD_IOMMU (which selects PCI_PRI) was
> enabled or PCI_PRI was enabled explicitly.
>
> The behavior of iommu_enable_dev_iotlb() should not depend on whether
> AMD_IOMMU is enabled.  Make it predictable by having INTEL_IOMMU_SVM select
> PCI_PRI so iommu_enable_dev_iotlb() always uses the full implementations of
> PRI interfaces.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

> ---
>   drivers/iommu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index e3842eabcfdd..b183c9f916b0 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -207,6 +207,7 @@ config INTEL_IOMMU_SVM
>   	bool "Support for Shared Virtual Memory with Intel IOMMU"
>   	depends on INTEL_IOMMU && X86
>   	select PCI_PASID
> +	select PCI_PRI
>   	select MMU_NOTIFIER
>   	help
>   	  Shared Virtual Memory (SVM) provides a facility for devices

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
