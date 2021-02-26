Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA5632601E
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 10:36:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D943842FB2;
	Fri, 26 Feb 2021 09:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCYTPFDwkqp5; Fri, 26 Feb 2021 09:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2523431CE;
	Fri, 26 Feb 2021 09:36:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A497EC0012;
	Fri, 26 Feb 2021 09:36:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BFE3C0001
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FD1431CE
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLmMsFdh9y4N for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 09:36:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BCAC42FB2
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:36:11 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id z13so8991037iox.8
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 01:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
 b=YlJGaB2HjeORjhsgYOy8pctb9+8JkGl/ZdIRVJcfQxCMoR62lL7XtrY95NgsqhINjE
 lSgvnnp9tfO6u1oKErjW0g+HTDOG3GFiOyn5d4dJiyFIJKbzFBupmPEB/V7jXmUb4d2q
 N9u5qLxflCWFXhFfzUGrtIkZV0aKvT2pOtERk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
 b=JT64vdloWLTWFMKiQKc0HRIQSjVmbIyqPNeuIDb2BCd9kU6vuYANRepUB8S+IZsLe7
 /t4HJx5ZbrTlE2MH/gNQfkW4f3dGuDBQ2FdewIf1vciEr/ZOH0AALZ2XYEl1krjmv/Mx
 Kk/JsRGVXyiFrdE3vC52ICWJqfSSsWEYsKQJjb6/Z76ATxUEBBwp5Y6ncTsZ7Ea6yd0f
 1o29wwPLX4z4RFAPGPnHBbEQqqe/VmxJzKIVzzgF9zAvIbtQsZloE+LBtlM0ZZ6tHj0C
 CENdCKrrvBpeMi2+Yb8KxfOCTUQe2h4ndss67574nfWG5mzdnyRqmCjCjTE6l2aXl8r1
 x7jQ==
X-Gm-Message-State: AOAM530HxxQoAR14RXHQmz4u/zp7SUuAj3LCCQ3WMFa0/SZ8ldcLtto6
 1S6C1/xLyPLgI4ykodY2TZSb88sHb1rdZQ==
X-Google-Smtp-Source: ABdhPJyWgrsIzaIiQ5YGYWD4CzTfvx7V73CY6jFylkt/217Rg1OcR2r/k1v15Os95EyHJ666Stig4w==
X-Received: by 2002:a02:7119:: with SMTP id n25mr1131926jac.48.1614332169771; 
 Fri, 26 Feb 2021 01:36:09 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id i3sm4276673ilm.56.2021.02.26.01.36.08
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:36:09 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id i8so8994738iog.7
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 01:36:08 -0800 (PST)
X-Received: by 2002:a02:b61a:: with SMTP id h26mr2057255jam.90.1614332168202; 
 Fri, 26 Feb 2021 01:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-13-tientzu@chromium.org>
 <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
 <20210226051740.GB2072@lst.de>
In-Reply-To: <20210226051740.GB2072@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 26 Feb 2021 17:35:57 +0800
X-Gmail-Original-Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
To: Christoph Hellwig <hch@lst.de>
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>
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

On Fri, Feb 26, 2021 at 1:17 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Feb 26, 2021 at 12:17:50PM +0800, Claire Chang wrote:
> > Do you think I should fix this and rebase on the latest linux-next
> > now? I wonder if there are more factor and clean up coming and I
> > should wait after that.
>
> Here is my preferred plan:
>
>  1) wait for my series to support the min alignment in swiotlb to
>     land in Linus tree
>  2) I'll resend my series with the further swiotlb cleanup and
>     refactoring, which includes a slightly rebased version of your
>     patch to add the io_tlb_mem structure
>  3) resend your series on top of that as a baseline
>
> This is my current WIP tree for 2:
>
>   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-struct

Sounds good to me. Thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
