Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90103D8A46
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 09:51:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9746949;
	Wed, 16 Oct 2019 07:51:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AB9C5949
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:51:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 69FA55D3
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 07:51:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id BDA7845B; Wed, 16 Oct 2019 09:51:22 +0200 (CEST)
Date: Wed, 16 Oct 2019 09:51:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yian Chen <yian.chen@intel.com>
Subject: Re: [PATCH] iommu/vt-d: Check VT-d RMRR region in BIOS is reported
	as reserved
Message-ID: <20191016075120.GB32232@8bytes.org>
References: <20191015164932.18185-1-yian.chen@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015164932.18185-1-yian.chen@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
	Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Hi,

On Tue, Oct 15, 2019 at 09:49:32AM -0700, Yian Chen wrote:
> VT-d RMRR (Reserved Memory Region Reporting) regions are reserved
> for device use only and should not be part of allocable memory pool of OS.
> 
> BIOS e820_table reports complete memory map to OS, including OS usable
> memory ranges and BIOS reserved memory ranges etc.
> 
> x86 BIOS may not be trusted to include RMRR regions as reserved type
> of memory in its e820 memory map, hence validate every RMRR entry
> with the e820 memory map to make sure the RMRR regions will not be
> used by OS for any other purposes.

Are there real systems in the wild where this is a problem?

> +static inline int __init
> +arch_rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
> +{
> +	u64 start = rmrr->base_address;
> +	u64 end = rmrr->end_address + 1;
> +
> +	if (e820__mapped_all(start, end, E820_TYPE_RESERVED))
> +		return 0;
> +
> +	pr_err(FW_BUG "No firmware reserved region can cover this RMRR [%#018Lx-%#018Lx], contact BIOS vendor for fixes\n",
> +	       start, end - 1);
> +	return -EFAULT;
> +}

Why -EFAULT, there is no fault involved? Usibg -EINVAL seems to be a better choice.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
