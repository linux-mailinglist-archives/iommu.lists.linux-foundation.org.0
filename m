Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E12731FF
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 20:33:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DB632226EA;
	Mon, 21 Sep 2020 18:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TJJnKrltS4s; Mon, 21 Sep 2020 18:33:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1FFF72266C;
	Mon, 21 Sep 2020 18:33:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3FC5C0051;
	Mon, 21 Sep 2020 18:33:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2234AC0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C58985F6D
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 18:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c34cD6JeVgnM for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 18:33:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01A7A81439
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 18:33:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so458415wmh.4
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2pljieOa3zqVRg/nGCsqWTPIMVj9a7ObD+5hzvK2Z0I=;
 b=s/2lSfECPbjLHM2LdhQLNaMh78qvA/Uu+BsbwbIwRyEVeTA30UJJJ26rlr0/UdPmIj
 q6EtpiecmC2cTci+sv0gqZhFfHO0H9VgrYQ/YF7xuti1+alXMRMily9jWUq/lvLQ9b9G
 SpcGH6rlbNgPOBVhfYQK1JE5JfKgj4cLpi2MYoRmZbY/f1VzAD55/ZBfiqWlqi+W8QK2
 2fsbgcim3qo9fRXr77t63uZtuqi4MJmRs/vywjq3keI9xP9xz9HwvGNlGjs8XKZZFF33
 /tOeYdh+UaFxmA6mb9Jb3PdX7yYd2lRr3gUz9pzyjPXpriHZQ2Hiw4klgPs/5bo/ObzN
 wspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2pljieOa3zqVRg/nGCsqWTPIMVj9a7ObD+5hzvK2Z0I=;
 b=Pt5ygZLQ7etGDMDcui+y5OzWDltJ1V5CvuO1l2d3i7ujgn4fuTTYxfk1eiOZgyrjfO
 nUYi324h4MHqMmHdorPDXY+/XIGyj/DvyoY+yDPYozx/WgHQHnazADe560klWfHWaQja
 Xaubvpk1mAxPZNs1yjHVkgAp1xC+aBFOJe5jDZNSlpwhG82+g6CV6G1NbdMTu0h7AmDK
 XwRSrxLjQG89/8ZAqzloGdCgbhaW0H2w6n6CvBMlfqzt5hYVXdRTWNfiwI1Rp2Km7QHl
 5RCLBXwojyaizc0xngqoLResJ6gI/MqQ91MpAySr1xwf+JsWnoCmbK1NFcV8yLP3P/lA
 8Pag==
X-Gm-Message-State: AOAM531yxeQKJSMhoL33FDXLWpVEh1fommrmzHETT7CYKv6eVAMmyDgQ
 r1z3Kr7rWa46T8QdebidCn+SgB9w97HAy4OfKAI=
X-Google-Smtp-Source: ABdhPJwOdkyX2T0nNsDtEYqTQPWOnuWTEliEywfKgd/Kd/kkmsATU6V+QmG/OrZNm2joFQfWrCrOoKg8VsCqThpuZIU=
X-Received: by 2002:a7b:c345:: with SMTP id l5mr630045wmj.123.1600713213466;
 Mon, 21 Sep 2020 11:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200918011357.909335-1-yukuai3@huawei.com>
 <20200921175048.GD3141@willie-the-truck>
 <CAF6AEGuVsuOxhFONDpJF4EsY-KWQu+Vna_CM9dPhrFS_9FQsqA@mail.gmail.com>
In-Reply-To: <CAF6AEGuVsuOxhFONDpJF4EsY-KWQu+Vna_CM9dPhrFS_9FQsqA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Sep 2020 11:33:21 -0700
Message-ID: <CAF6AEGu1CLqQcowTz+V8E5fj2FLFKLmUMchz1hDP1niM8QDkPQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
To: Will Deacon <will@kernel.org>
Cc: yi.zhang@huawei.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Yu Kuai <yukuai3@huawei.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 21, 2020 at 11:27 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 21, 2020 at 10:50 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Sep 18, 2020 at 09:13:57AM +0800, Yu Kuai wrote:
> > > if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> > > a corresponding put_device(). Thus add put_device() to fix the exception
> > > handling for this function implementation.
> > >
> > > Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")
> >
> > That's probably not accurate, in that this driver used to live under
> > drivers/iommu/ and assumedly had this bug there as well.
> >

and fwiw, that looks like it should be:

Fixes: 0ae349a0f33fb ("iommu/qcom: Add qcom_iommu")

> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > I guess Rob will pick this up.
>
> Probably overkill for me to send a pull req for a single patch, if you
> want to pick it up:
>
> Acked-by: Rob Clark <robdclark@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
