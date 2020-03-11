Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE3181F5E
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 18:26:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6830D89380;
	Wed, 11 Mar 2020 17:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcdiVCilICF2; Wed, 11 Mar 2020 17:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00B1A8937D;
	Wed, 11 Mar 2020 17:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E72FBC0177;
	Wed, 11 Mar 2020 17:26:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2EFEC0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA0E285BF2
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fHitQaLTVKo for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92AC485BEC
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:26:08 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v8so1497614lfe.2
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UQVTnSguLvRHX8NkQfjS8un3uykC9cqMpLahtA/RCg=;
 b=GrfSUxt32RjLZyaJPIAa3ArKZfFLgmyXUhhc6z9ZYUHpqkjsZJXWpZTdbOeR0enVyY
 cErHS778dqtMr3tuFGIFaNXU7LUM/bueoJ9eXLgY0fNFghVCnkTw99fpgxs9DerMYc71
 sTgy2oVN6YxRd7pO9A9+Fj5ve8WsIRlC/QPTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UQVTnSguLvRHX8NkQfjS8un3uykC9cqMpLahtA/RCg=;
 b=HL5AbU5JI8Cwg4klsm6nfKVVDMQcNfZbcNQAT0l2TY2QFYia6Otn4DipzrrSI4Ayhq
 /t3qDixpiGXXwVTqdOaKmMJTAo/ACkgRofklH2bOP12i4h4qg0DRrO4nH6MYCaYZ5BEw
 zQY76pIfLEnlDPhK1nZFKotqrGiTeHMC1CL/XCBqAiEvywBJhN3EYyeZuIzH9naxldwR
 BEFt6xpZ8kMiieL9ZKj3h24y4KEmGhka99cjjy3NZs8CtAOv3Eeye06EZ/MsoQKkUd5N
 4CpQ2N5dJD5VlE2QmMLWjffJX+I1DXppyC26Ge4R3jpDK1Luxt6A1yGjm5F1HbRftZ3Q
 jnFA==
X-Gm-Message-State: ANhLgQ06oNaShvzngDwxs+rVVX6GIOlspTGsRZ8Lf+ecsDQdsPJKeBPz
 Wwe0kCvHaseYkvbUSbykHjYcSw8NUwnClA==
X-Google-Smtp-Source: ADFU+vvtWY2qM5mZiLRM/keUTYiY+p12aUEBI+DqUeckKxxG2fDKBcZSisAwlpi3DgWo1I68uA21kg==
X-Received: by 2002:ac2:5dd8:: with SMTP id x24mr995698lfq.180.1583947565720; 
 Wed, 11 Mar 2020 10:26:05 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id g20sm1639316lfe.65.2020.03.11.10.26.04
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 10:26:04 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id e18so3223079ljn.12
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 10:26:04 -0700 (PDT)
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr2749942ljp.150.1583947564287; 
 Wed, 11 Mar 2020 10:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200311160710.376090-1-hch@lst.de>
 <20200311161423.GA3941932@kroah.com>
 <20200311161551.GA24878@lst.de> <20200311171802.GA3952198@kroah.com>
In-Reply-To: <20200311171802.GA3952198@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 10:25:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj5hFUTG8qEzfJTecND2pSuxe0XcVPMjBpX7f1m19Wjqw@mail.gmail.com>
Message-ID: <CAHk-=wj5hFUTG8qEzfJTecND2pSuxe0XcVPMjBpX7f1m19Wjqw@mail.gmail.com>
Subject: Re: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, Christoph Hellwig <hch@lst.de>,
 iommu <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Mar 11, 2020 at 10:18 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Is this still needed with the patch that Linus just committed to his
> tree?

My patch is basically the same, just with the field renamed too, and
not blindly just assigning to "*pdev->dev.dma_mask" (my variant does

        pdev->platform_dma_mask = pdevinfo->dma_mask;
        pdev->dev.dma_mask = &pdev->platform_dma_mask;

instead of that incomprehensible

        *pdev->dev.dma_mask = pdevinfo->dma_mask;

which depends on that dev.dma_mask pointer having been initialized in
a random place earlier).

I had the cleanups (uncommited) in my tree, and just removed the
kfree() as per Christoph.

             Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
