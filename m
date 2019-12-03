Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DF110553
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 20:40:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB90987673;
	Tue,  3 Dec 2019 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKDw5CEbn5H6; Tue,  3 Dec 2019 19:40:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A9FE87672;
	Tue,  3 Dec 2019 19:40:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD3FC087F;
	Tue,  3 Dec 2019 19:40:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF08EC087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9914286D76
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yEW5wECxhwqA for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 19:40:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DB32586D6F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 19:40:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y14so1879364pfm.13
 for <iommu@lists.linux-foundation.org>; Tue, 03 Dec 2019 11:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfDVgB5+i6zMO7sX/GHYsvnOpqqvJcvPmfj3Eu7Zh4c=;
 b=mTWcfIvZlqb3Fyx4NUGszEs7Ru7EDfEdW7iIznueVQ4g/GPjYgnNGS2wbbUBGSq0is
 EgMnNCa6m9Mgv/iY1hRqtlsSwWennBTCnoRYhRNlWOljckrrN0jfAEpz8r8lJi36+eCr
 b3MggEuXHLQsyTv+E9SDS0+hnNDjFj3ssH1AziU2GW/8WWTow6FtxOQp8Gf1K0uDIaW/
 yHUeLieIY8k/2hmKdw0qD2miEx7hGaLgBUWaLLpmJQP01G5dY/F4DBnFPzDJ0W4qAO3L
 3HgkRxJKNVAZf2+Ue635aFtvTUPuY8FFFt2CCkaUPsU9a6k/fexPl05lA3W7eZ7BbIcA
 idxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfDVgB5+i6zMO7sX/GHYsvnOpqqvJcvPmfj3Eu7Zh4c=;
 b=IglaII45ZIfSE6pq0xCs/W3IEtGwIH1ByI7fRnp18YRrUsJop7RZFAutB6RtuztR4p
 3W60NdsL3pvsZW8S2S8v44errhiL4OWriuJu1rDanm8GFzxsK2zQrOaNvIWoO2rk7IlR
 xsdJHades7m5lCDr6W4Vv4PpybC4aeUVX66q3X2hYGMyN1nAVroBIxX+KapGKNYX6/C7
 9o4izJmixhWZK33so8mTbSOldmfeVT4hCnpJVkOyJvg8kkDurZrDSXOL26ySRCjwZdBj
 +zTmgktqe/BKSpP2MC+9JkL93U3iO6M7L0vaFqYwr78rU8I8WxzdDL6QSGjDWCC0N5+m
 COpQ==
X-Gm-Message-State: APjAAAUc7wFybG1/ojGJ2uBJZF19cWzkkuYNu6b2reFYITN+MGwkobGG
 a06Q02TSBitcsguH4P+ZLO1IgkP7myuo1Z21NCQ=
X-Google-Smtp-Source: APXvYqzjpbPmnmo7+e0YFMOFzXQ62Ql/XSh2Qjwwjzqstd9rwX8jXIFS1c31sqZf8pkK6pCLm6IgvSLfMvKBorczZSM=
X-Received: by 2002:a65:44ca:: with SMTP id g10mr7238631pgs.104.1575402050480; 
 Tue, 03 Dec 2019 11:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
 <20191129004855.18506-3-xiyou.wangcong@gmail.com>
 <dc182be3-be98-9a8e-013c-16df0e529ed2@huawei.com>
 <CAM_iQpX3MKoBRvxqc-bJ0HvASNeZmvVCYhbT53maMy-rqy4eiw@mail.gmail.com>
 <9996d30c-e063-e74d-925f-4181c36ca764@huawei.com>
In-Reply-To: <9996d30c-e063-e74d-925f-4181c36ca764@huawei.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Tue, 3 Dec 2019 11:40:34 -0800
Message-ID: <CAM_iQpX+V=Hv+3QQU-FrsRKm=75cghSTx-ip2oU=Mn1tdXywjA@mail.gmail.com>
Subject: Re: [Patch v2 2/3] iommu: optimize iova_magazine_free_pfns()
To: John Garry <john.garry@huawei.com>
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Dec 2, 2019 at 2:02 AM John Garry <john.garry@huawei.com> wrote:
>
> On 30/11/2019 06:02, Cong Wang wrote:
> > On Fri, Nov 29, 2019 at 5:24 AM John Garry <john.garry@huawei.com> wrote:
> >>
> >> On 29/11/2019 00:48, Cong Wang wrote:
> >>> If the maganize is empty, iova_magazine_free_pfns() should
> >>
> >> magazine
> >
> > Good catch!
> >
> >>
> >>> be a nop, however it misses the case of mag->size==0. So we
> >>> should just call iova_magazine_empty().
> >>>
> >>> This should reduce the contention on iovad->iova_rbtree_lock
> >>> a little bit.
> >>>
> >>> Cc: Joerg Roedel <joro@8bytes.org>
> >>> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> >>> ---
> >>>    drivers/iommu/iova.c | 22 +++++++++++-----------
> >>>    1 file changed, 11 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> >>> index cb473ddce4cf..184d4c0e20b5 100644
> >>> --- a/drivers/iommu/iova.c
> >>> +++ b/drivers/iommu/iova.c
> >>> @@ -797,13 +797,23 @@ static void iova_magazine_free(struct iova_magazine *mag)
> >>>        kfree(mag);
> >>>    }
> >>>
> >>> +static bool iova_magazine_full(struct iova_magazine *mag)
> >>> +{
> >>> +     return (mag && mag->size == IOVA_MAG_SIZE);
> >>> +}
> >>> +
> >>> +static bool iova_magazine_empty(struct iova_magazine *mag)
> >>> +{
> >>> +     return (!mag || mag->size == 0);
> >>> +}
> >>> +
> >>>    static void
> >>>    iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
> >>>    {
> >>>        unsigned long flags;
> >>>        int i;
> >>>
> >>> -     if (!mag)
> >>> +     if (iova_magazine_empty(mag))
> >>
> >> The only hot path we this call is
> >> __iova_rcache_insert()->iova_magazine_free_pfns(mag_to_free) and
> >> mag_to_free is full in this case, so I am sure how the additional check
> >> helps, right?
> >
> > This is what I mean by "a little bit" in changelog, did you miss it or
> > misunderstand it? :)
>
> I was concerned that in the fastpath we actually make things very
> marginally slower by adding a check which will fail.

The check is done without any locking, so it is cheap. And it is a
common pattern that we do a check without lock and do a second same
check with lock:

https://en.wikipedia.org/wiki/Double-checked_locking

Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
