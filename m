Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954451305D
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 11:54:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0499F41A5A;
	Thu, 28 Apr 2022 09:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYwEegCeC3hf; Thu, 28 Apr 2022 09:54:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DEA6441A56;
	Thu, 28 Apr 2022 09:54:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA3E6C0081;
	Thu, 28 Apr 2022 09:54:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18066C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 057A340AE5
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPdAZGzmJxhy for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 09:54:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75760400C1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 09:54:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 77FEC2FB; Thu, 28 Apr 2022 11:54:28 +0200 (CEST)
Date: Thu, 28 Apr 2022 11:54:27 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v2 02/37] iommu/amd: Introduce pci segment structure
Message-ID: <YmpkU4jvfd/1Sl6i@8bytes.org>
References: <20220425113415.24087-1-vasant.hegde@amd.com>
 <20220425113415.24087-3-vasant.hegde@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425113415.24087-3-vasant.hegde@amd.com>
Cc: iommu@lists.linux-foundation.org
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

Hi Vasant,

On Mon, Apr 25, 2022 at 05:03:40PM +0530, Vasant Hegde wrote:
> +/*
> + * This structure contains information about one PCI segment in the system.
> + */
> +struct amd_iommu_pci_seg {
> +	struct list_head list;

The purpose of this list_head needs a comment.

> +
> +	/* PCI segment number */
> +	u16 id;
> +};
> +/*
> + * List with all PCI segments in the system. This list is not locked because
> + * it is only written at driver initialization time
> + */
> +extern struct list_head amd_iommu_pci_seg_list;

So there will never be hotplug of a PCI segment? Say together with
hotplugging a CPU?

> +static void __init free_pci_segment(void)

This needs plural: free_pci_segments(), as it frees all segments.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
