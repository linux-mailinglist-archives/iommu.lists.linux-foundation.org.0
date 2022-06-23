Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D37DA5574C7
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 10:03:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D93384563;
	Thu, 23 Jun 2022 08:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D93384563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kU-mRyKlxBx8; Thu, 23 Jun 2022 08:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 92A5884561;
	Thu, 23 Jun 2022 08:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A5884561
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 470D5C007E;
	Thu, 23 Jun 2022 08:03:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5091C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A6E040569
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A6E040569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVEWiNxHGNxs for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 08:03:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C76F640566
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C76F640566
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:03:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 50207447; Thu, 23 Jun 2022 10:03:42 +0200 (CEST)
Date: Thu, 23 Jun 2022 10:03:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v1 3/7] iommu/amd: Fix sparse warning
Message-ID: <YrQeXdR8yPOyv957@8bytes.org>
References: <20220603112107.8603-1-vasant.hegde@amd.com>
 <20220603112107.8603-4-vasant.hegde@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603112107.8603-4-vasant.hegde@amd.com>
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

On Fri, Jun 03, 2022 at 04:51:03PM +0530, Vasant Hegde wrote:
> Fix below sparse warning:
>   CHECK   drivers/iommu/amd/iommu.c
>   drivers/iommu/amd/iommu.c:73:24: warning: symbol 'amd_iommu_ops' was not declared. Should it be static?
> 
> Also we are going to introduce v2 page table which has different
> pgsize_bitmaps. Hence remove 'const' qualifier.

I am not a fan of removing the consts. Please use separate ops
structures for v2 page-tables and make then const as well. This probably
also has some optimization potential in the future when we can make the
ops call-back functions page-table specific.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
