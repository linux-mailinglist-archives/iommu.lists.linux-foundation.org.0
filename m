Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C214D342B
	for <lists.iommu@lfdr.de>; Fri, 11 Oct 2019 01:09:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 386DBD3E;
	Thu, 10 Oct 2019 23:09:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76C59CAC
	for <iommu@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 23:09:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0DEB15D3
	for <iommu@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 23:09:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2019 16:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="197403278"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 10 Oct 2019 16:09:23 -0700
Received: from [10.54.74.33] (skuppusw-desk.jf.intel.com [10.54.74.33])
	by linux.intel.com (Postfix) with ESMTP id C3F7D5802B9;
	Thu, 10 Oct 2019 16:09:23 -0700 (PDT)
Subject: Re: [PATCH 1/3] PCI/ATS: Remove unused PRI and PASID stubs
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20191009225354.181018-1-helgaas@kernel.org>
	<20191009225354.181018-2-helgaas@kernel.org>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel
Message-ID: <2f3804d1-ad85-b54f-9fd3-788f35121fac@linux.intel.com>
Date: Thu, 10 Oct 2019 16:07:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009225354.181018-2-helgaas@kernel.org>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Krzysztof Wilczynski <kw@linux.com>, Ashok Raj <ashok.raj@intel.com>,
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
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


On 10/9/19 3:53 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> The following functions are only used by amd_iommu.c and intel-iommu.c
> (when CONFIG_INTEL_IOMMU_SVM is enabled).  CONFIG_PCI_PRI and
> CONFIG_PCI_PASID are always defined in those cases, so there's no need for
> the stubs.
>
>    pci_enable_pri()
>    pci_disable_pri()
>    pci_reset_pri()
>    pci_prg_resp_pasid_required()
>    pci_enable_pasid()
>    pci_disable_pasid()
>
> Remove the unused stubs.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>   include/linux/pci-ats.h | 10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index 67de3a9499bb..963c11f7c56b 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -27,14 +27,7 @@ void pci_restore_pri_state(struct pci_dev *pdev);
>   int pci_reset_pri(struct pci_dev *pdev);
>   int pci_prg_resp_pasid_required(struct pci_dev *pdev);
>   #else /* CONFIG_PCI_PRI */
> -static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
> -{ return -ENODEV; }
> -static inline void pci_disable_pri(struct pci_dev *pdev) { }
>   static inline void pci_restore_pri_state(struct pci_dev *pdev) { }
> -static inline int pci_reset_pri(struct pci_dev *pdev)
> -{ return -ENODEV; }
> -static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
> -{ return 0; }
>   #endif /* CONFIG_PCI_PRI */
>   
>   #ifdef CONFIG_PCI_PASID
> @@ -44,9 +37,6 @@ void pci_restore_pasid_state(struct pci_dev *pdev);
>   int pci_pasid_features(struct pci_dev *pdev);
>   int pci_max_pasids(struct pci_dev *pdev);
>   #else /* CONFIG_PCI_PASID */
> -static inline int pci_enable_pasid(struct pci_dev *pdev, int features)
> -{ return -EINVAL; }
> -static inline void pci_disable_pasid(struct pci_dev *pdev) { }
>   static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
>   static inline int pci_pasid_features(struct pci_dev *pdev)
>   { return -EINVAL; }

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
