Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AA232C89
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 09:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4848C87F5C;
	Thu, 30 Jul 2020 07:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gv6uY+nI1n96; Thu, 30 Jul 2020 07:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C8C287EAA;
	Thu, 30 Jul 2020 07:28:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB1AFC004D;
	Thu, 30 Jul 2020 07:28:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B2F9C004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 07:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 649EA84775
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 07:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJNItG0bysmt for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 07:28:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0C9D8846F4
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 07:28:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58CB7206E6;
 Thu, 30 Jul 2020 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596094128;
 bh=0vavgTMDfVfwJjBVHBedsRYmusoi+PhLN5q4bb6SHOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7tAP4FWtQkiZLoSwjJG62hN21GEeii/kdwCI0X9X+ZE8Afmu4bmmgbRB2yHY8xX4
 x0AxjqMYqtL1LtiJBV1vstzxiSfi9U1nSknRZkrKYNVNIVAFcgXvixL77abIMuLEbz
 R4GCQERO0n7rhsXI297WaDYODKd8Ovh7tv8mg9CA=
Date: Thu, 30 Jul 2020 09:28:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2] iommu: amd: Fix IO_PAGE_FAULT due to __unmap_single()
 size overflow
Message-ID: <20200730072837.GB4045776@kroah.com>
References: <20200624084121.6588-1-suravee.suthikulpanit@amd.com>
 <20200624090906.GC1731290@kroah.com>
 <20200624115827.GO3701@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624115827.GO3701@8bytes.org>
Cc: iommu@lists.linux-foundation.org, stable@vger.kernel.org
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

On Wed, Jun 24, 2020 at 01:58:27PM +0200, Joerg Roedel wrote:
> Hi Greg,
> 
> On Wed, Jun 24, 2020 at 11:09:06AM +0200, Greg KH wrote:
> > So what exact stable kernel version(s) do you want to see this patch
> > applied to?
> 
> It is needed in kernels <= v5.4. Linux v5.5 has replaced the code with
> the bug.

This doesn't apply to any older kernels that I can see :(
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
