Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5218E275330
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 10:25:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E22B3872F6;
	Wed, 23 Sep 2020 08:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g+ULFq9x2QqZ; Wed, 23 Sep 2020 08:25:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E31A7872F4;
	Wed, 23 Sep 2020 08:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C90BDC0051;
	Wed, 23 Sep 2020 08:25:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2B2FC0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 08:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE62385FC1
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 08:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEcY9BuWtSPI for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 08:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00D8B85FA0
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 08:25:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m6so20019866wrn.0
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzROUGMKNRgnnDL4NwgHcw/pm1uqI4QZGJMEsixQdd8=;
 b=MNb6WQXPUqp24elHaHfaMk9QtEc3fyoOSavaOMJTbAuFVx4EHB79HJMVm4ABBZ1utd
 SJCTPziVz1iwOghnysLN2vE89R0zmeUHHyBXVUFWpffc3tfGrjPavnLTaAC9FY38EUcN
 8olvxROZ8MdkA17jt7Go2ajTn8or4BhGQ7hhJEo/D14nuBiN/5HwjUNFmq7pAB01dprA
 RYvFwCYA9KdEQYqxgigA9A+y9Ix//47Ob3xnag8A4MaxUdc3u6SJpzJHRYR1jpoQT0rQ
 QcT6AgfIhBsZumsjMWr82I8RkIzWbnDim0V0tn/FfobKtHK7BZ0MOlwmcApWm6/KWWRy
 PpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzROUGMKNRgnnDL4NwgHcw/pm1uqI4QZGJMEsixQdd8=;
 b=mnussKw4xt8V1uKZyjsiAnM+hkVXfZDVFc6r+6pRcphH+YhsezGnhQj6TXn2d97CbF
 GE2/k0+WF+/YIZwlzrOSY8YpoCEypim6PUOzXeRpjgS/1Uj4YZ8LemKVDpJ9R8m1R6/D
 OLid1u9qH7JDqBdFd49V5MpkjaxMztAmcL/ntAPMd3Y99RPF5k1ra3YmmPpBhN9J98lt
 t46Iz/fE7PfXo+CYuoPta0EZzppn4pgJ9ZBlGtX+mbe80VnxOm00zdiZYkLNRKBDlwQy
 BohDWFL7FXSjeOvvQ5AsI5WAiZIH08B8gwrPpwtEJu5Q1jzeRnvIr93xZJgBo4iOaFSm
 fGlQ==
X-Gm-Message-State: AOAM53359U/EsQTULFiDkThxwfHS1lwf2C/qF2HUFpvMG2MQSdJLaU/Q
 8U7CEpO+k4zkdyOZNrN7/QLQB85lefIV6xfFxaM=
X-Google-Smtp-Source: ABdhPJzY/stJggWOWyJdw5UFRsFPhz2J70u/U6Ytdc7H4uw7tqDrNHhrWvo1p4HWhuGgvZmSpp6K9Ko6daWcDcSJgdQ=
X-Received: by 2002:adf:dd44:: with SMTP id u4mr9368679wrm.22.1600849550309;
 Wed, 23 Sep 2020 01:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEC9eQOX9BHX4v5aY2cfCT=T-ZHA7y0xF7aiZhW9xzG4fme36Q@mail.gmail.com>
 <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
 <59cda41f-170c-a1ad-a345-bc38b9ed4d73@arm.com>
 <CGME20200424161534eucas1p29177cad5b4790d392acb69a335a3992e@eucas1p2.samsung.com>
 <CAOD6ATrWYLPT0ydz2vFhNwWhqHum_q_pyCe=oGJWOcEqjmNOqQ@mail.gmail.com>
 <11584d09-5995-6133-3bd3-8f7a0afd0e01@samsung.com>
 <20200923065808.GA16366@lst.de>
In-Reply-To: <20200923065808.GA16366@lst.de>
From: Ajay Kumar <ajaykumar.rs1989@gmail.com>
Date: Wed, 23 Sep 2020 13:55:39 +0530
Message-ID: <CADe9J7H6G8KmjMvzfW36+dZLWgnpiRVGCBXfq1XhSaSdY+c2Yw@mail.gmail.com>
Subject: Re: IOVA allocation dependency between firmware buffer and remaining
 buffers
To: Christoph Hellwig <hch@lst.de>
Cc: jean-philippe@linaro.org, Shaik Ameer Basha <shaik.ameer@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, sathya.panda@samsung.com,
 linux-mm@kvack.org, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>,
 will@kernel.org, ajaykumar.rs@samsung.com
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

Hello all,

We pretty much tried to solve the same issue here with a new API in DMA-IOMMU:
https://lore.kernel.org/linux-iommu/20200811054912.GA301@infradead.org/T/

Christoph - the user part would be MFC devices on exynos platforms

Thanks,
Ajay


On Wed, Sep 23, 2020 at 12:28 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Sep 23, 2020 at 08:48:26AM +0200, Marek Szyprowski wrote:
> > Hi Shaik,
> >
> > I've run into similar problem while adapting S5P-MFC and Exynos4-IS
> > drivers for generic IOMMU-DMA framework. Here is my first solution:
> > https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/T/
> >
> >
> > It allows to remap given buffer at the specific IOVA address, although
> > it doesn't guarantee that those specific addresses won't be later used
> > by the IOVA allocator. Probably it would make sense to add an API for
> > generic IOMMU-DMA framework to mark the given IOVA range as
> > reserved/unused to protect them.
>
> If you want to use IOVA addresses in a device otherwise managed by
> dma-iommu we need to expose an API through the dma API.  Can you please
> include the iommu list in the discussion of your series?
>
> I don't think using the raw IOMMU API is a very idea in these drivers,
> we probably want a way to change the allocator algorithm or hint the
> next IOVA and keep using the normal DMA API.  Maybe Robin has a better
> idea.
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
