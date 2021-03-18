Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146B3408DC
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 16:28:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DAC24328B;
	Thu, 18 Mar 2021 15:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usHQmlFwHnAj; Thu, 18 Mar 2021 15:28:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B96B432AB;
	Thu, 18 Mar 2021 15:28:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19800C0001;
	Thu, 18 Mar 2021 15:28:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15263C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3CE7432AB
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxXlzYT4XlmR for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 15:28:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BE454328B
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:28:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 52FFE2DA; Thu, 18 Mar 2021 16:28:12 +0100 (CET)
Date: Thu, 18 Mar 2021 16:28:10 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH 4/7] iommu/amd: Initial support for AMD IOMMU v2 page
 table
Message-ID: <YFNxiiU9jc0+/oU9@8bytes.org>
References: <20210312090411.6030-1-suravee.suthikulpanit@amd.com>
 <20210312090411.6030-5-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312090411.6030-5-suravee.suthikulpanit@amd.com>
Cc: iommu@lists.linux-foundation.org, Jon.Grimm@amd.com,
 linux-kernel@vger.kernel.org, Wei.Huang2@amd.com
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

Hi Suravee,

On Fri, Mar 12, 2021 at 03:04:08AM -0600, Suravee Suthikulpanit wrote:
> @@ -503,6 +504,7 @@ struct amd_io_pgtable {
>  	int			mode;
>  	u64			*root;
>  	atomic64_t		pt_root;    /* pgtable root and pgtable mode */
> +	struct mm_struct	v2_mm;
>  };

A whole mm_struct is a bit too much when all we really need is an 8-byte
page-table root pointer.


> +static pte_t *fetch_pte(struct amd_io_pgtable *pgtable,
> +		      unsigned long iova,
> +		      unsigned long *page_size)
> +{
> +	int level;
> +	pte_t *ptep;
> +
> +	ptep = lookup_address_in_mm(&pgtable->v2_mm, iova, &level);
> +	if (!ptep || pte_none(*ptep) || (level == PG_LEVEL_NONE))
> +		return NULL;

So you are re-using the in-kernel page-table building code. That safes
some lines of code, but has several problems:

	1) When you boot a kernel with this code on a machine with
	   5-level paging, the IOMMU code will build a 5-level
	   page-table too, breaking IOMMU mappings.

	2) You need a whole mm_struct per domain, which is big.

	3) The existing macros for CPU page-tables require locking. For
	   IOMMU page-tables this is not really necessary and might
	   cause scalability issues.

Overall I think you should write your own code to build a 4-level
page-table and use cmpxchg64 to avoid the need for locking. Then things
will not break when such a kernel is suddenly booted on a machine which
as 5-level paging enabled.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
