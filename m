Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD520950
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 16:15:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0FC8D8C;
	Thu, 16 May 2019 14:15:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3DAFEB7D
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 14:15:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E86615E4
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 14:15:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABACE1A25;
	Thu, 16 May 2019 07:15:04 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34573F7A6;
	Thu, 16 May 2019 07:15:02 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 09/16] iommu: Introduce guest PASID bind function
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
Message-ID: <d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
Date: Thu, 16 May 2019 15:14:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raj Ashok <ashok.raj@intel.com>
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

Hi Jacob,

On 03/05/2019 23:32, Jacob Pan wrote:
> +/**
> + * struct gpasid_bind_data - Information about device and guest PASID binding
> + * @gcr3:	Guest CR3 value from guest mm
> + * @pasid:	Process address space ID used for the guest mm
> + * @addr_width:	Guest address width. Paging mode can also be derived.
> + */
> +struct gpasid_bind_data {
> +	__u64 gcr3;
> +	__u32 pasid;
> +	__u32 addr_width;
> +	__u32 flags;
> +#define	IOMMU_SVA_GPASID_SRE	BIT(0) /* supervisor request */
> +	__u8 padding[4];
> +};

Could you wrap this structure into a generic one like we now do for
bind_pasid_table? It would make the API easier to extend, because if we
ever add individual PASID bind on Arm (something I'd like to do for
virtio-iommu, eventually) it will have different parameters, as our
PASID table entry has a lot of fields describing the page table format.

Maybe something like the following would do?

struct gpasid_bind_data {
#define IOMMU_GPASID_BIND_VERSION_1 1
	__u32 version;
#define IOMMU_GPASID_BIND_FORMAT_INTEL_VTD	1
	__u32 format;
	union {
		// the current gpasid_bind_data:
		struct gpasid_bind_intel_vtd vtd;
	};
};

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
