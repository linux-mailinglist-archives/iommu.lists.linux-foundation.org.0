Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8DC107580
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 17:13:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 743C588D64;
	Fri, 22 Nov 2019 16:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-GpzYBCaj7q; Fri, 22 Nov 2019 16:13:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B831A88D57;
	Fri, 22 Nov 2019 16:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A512EC18DA;
	Fri, 22 Nov 2019 16:13:15 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA3FC18DA
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 073DF88CE6
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 16:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEnkRGQDetYX for <iommu@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 16:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8ADF388CE4
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 16:13:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t1so9289192wrv.4
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 08:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ue+2IthhhGtKyv4t4iHUlxAukreMwi7oDs762tZEuAc=;
 b=KVOL2ZAVkRnPR+f4GChlOTRXBbJqDY56n2tqA4uC+oer6FUMpp/GFUTnENCOCwdTDw
 MfNT4733dkN8pzIiEfUJTCj4gRS3T96dFIrmeTjQ563Wd5aGIHHr+Oyi2lK+epJXU3IA
 HJewQ4Gh7EIx9yw+ljcwhwVtZuGOFe2ps3qudhV/vsrVxz/oLtKtdhR+UsU2GSJ+9z0M
 re/xyXPuIyHRmo+cZXzPO1OYphN0TBmLEOBuH9gIFHTTRr1RiNEGlZ3bIzOGV0uJaydG
 y0atF5KUKuPNWIbB7kNmnwF7DEcdGPz9W+gpopNZQ4rbVniRB3J5h0y6pKKmU34EH5CQ
 v2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ue+2IthhhGtKyv4t4iHUlxAukreMwi7oDs762tZEuAc=;
 b=ICpJa3DlYOUfrNm3c9DVttwfPtQ/zi9CGhCpxfLyob6wbv5UpDoS8HzPvObGv8mswJ
 oZIrpCkzsyYPVoYwfhN9uhxbGYrO38nYY++mjJIsEqzmOJgHTYd4emET6rlOj2BZtkID
 ZkNSyJ037bYKSFrcTNb+blRxU71+ZihujG2l4CNJze63iGQQ1UPJzslZjC64CbQkE2f1
 R905B6Ap9nYIyr1l8Fa+lOuxnydO7Jwv9F61vHvOjuXT2eIhRKgRhtZZSJZCDLhoG8xP
 s+WMJIOmVCbZStXSpYICGYDN69PLVVqvChpWEiT/hSetnGN8amOOsBK5Pd4JpIfEVs2z
 xdfw==
X-Gm-Message-State: APjAAAXnKc/LihL8USuVrWEte1j9pqcxuLR+F4G8XorJLIMgPO1OZXZK
 ktpiP6XJ+P/uHGE7v7YgWhTzB3/4vlfbFp3AzmE3LA==
X-Google-Smtp-Source: APXvYqzUwCgFnybDJAA94Iz+jswhtq7TUIdhMl8vsH+s/SaWoYv0C0ZIQLw5JdXIGbZZKbd7zy4UxC8zZB/Bs/gzDOc=
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr18963430wra.246.1574439190783; 
 Fri, 22 Nov 2019 08:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20191120190028.4722-1-will@kernel.org>
 <CAL_JsqJm+6Cg4JfG1EzRMJ2hyPV1O8WbitjGC=XMvZRDD+=OGw@mail.gmail.com>
 <20191122145525.GA14153@willie-the-truck>
 <CAL_JsqJvhP2YqQwAZg=GecpVNMbHN9OcZxTO8LrvH_jphFJw=A@mail.gmail.com>
In-Reply-To: <CAL_JsqJvhP2YqQwAZg=GecpVNMbHN9OcZxTO8LrvH_jphFJw=A@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 22 Nov 2019 17:12:59 +0100
Message-ID: <CAKv+Gu8HjzpDfh2=gUXuV-OLWbePVEPJU369V4_S6=Q7e4_bzg@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for "iommu-map"
To: Rob Herring <robh@kernel.org>
Cc: iommu@lists.linuxfoundation.org,
 Devicetree List <devicetree@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, 22 Nov 2019 at 17:01, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Nov 22, 2019 at 8:55 AM Will Deacon <will@kernel.org> wrote:
> >
> > [+Ard]
> >
> > Hi Rob,
> >
> > On Fri, Nov 22, 2019 at 08:47:46AM -0600, Rob Herring wrote:
> > > On Wed, Nov 20, 2019 at 1:00 PM Will Deacon <will@kernel.org> wrote:
> > > >
> > > > Commit 8e12257dead7 ("of: property: Add device link support for iommus,
> > > > mboxes and io-channels") added device link support for IOMMU linkages
> > > > described using the "iommus" property. For PCI devices, this property
> > > > is not present and instead the "iommu-map" property is used on the host
> > > > bridge node to map the endpoint RequesterIDs to their corresponding
> > > > IOMMU instance.
> > > >
> > > > Add support for "iommu-map" to the device link supplier bindings so that
> > > > probing of PCI devices can be deferred until after the IOMMU is
> > > > available.
> > > >
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Saravana Kannan <saravanak@google.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Signed-off-by: Will Deacon <will@kernel.org>
> > > > ---
> > > >
> > > > Applies against driver-core/driver-core-next.
> > > > Tested on AMD Seattle (arm64).
> > >
> > > Guess that answers my question whether anyone uses Seattle with DT.
> > > Seattle uses the old SMMU binding, and there's not even an IOMMU
> > > associated with the PCI host. I raise this mainly because the dts
> > > files for Seattle either need some love or perhaps should be removed.
> >
> > I'm using the new DT bindings on my Seattle, thanks to the firmware fairy
> > (Ard) visiting my flat with a dediprog. The patches I've posted to enable
> > modular builds of the arm-smmu driver require that the old binding is
> > disabled [1].
>
> Going to post those dts changes?
>

Last time I tried upstreaming seattle DT changes I got zero response,
so I didn't bother since.


> > > No issues with the patch itself though. I'll queue it after rc1.
> >
> > Thanks, although I think Greg has already queued it [2] due to the
> > dependencies on other patches in his tree.
>
> Okay, forgot to check my spam from Greg folder and missed that.
>
> Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
