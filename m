Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 088271F7D7B
	for <lists.iommu@lfdr.de>; Fri, 12 Jun 2020 21:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB9FF878E6;
	Fri, 12 Jun 2020 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipuUVb0GXIGv; Fri, 12 Jun 2020 19:24:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63B22878BA;
	Fri, 12 Jun 2020 19:24:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58456C016F;
	Fri, 12 Jun 2020 19:24:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D361DC016F
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF23A8991E
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HzNip+edc-3 for <iommu@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:24:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E8A9D8991A
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 19:24:08 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q19so12364624lji.2
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCcYxMzSmrdlhigKp7aCnsE882khzEZEkfB4TmM4Bdg=;
 b=iNBWJvbJ26Z9sGmdy88BthOnQc6hc14YR9MWYyu8II9G3YLysxwW8697VXQMUTln/r
 Xc6ZFFWFR3cp0sCyH1yStm8dQ8f1PheRAwGxmH8m/OGbjqjh36KdNvZAg4tlsLkIg31J
 qlgKnPxT6+NzqQ9EtPTxK98KgxF/S0zZzH6Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCcYxMzSmrdlhigKp7aCnsE882khzEZEkfB4TmM4Bdg=;
 b=aonlnqxFIAX1va2+xZskvEGQlab+rLB9zdROa7PSgTA4XjGvK2SqpxW6Zm3L3AvcMu
 xm+/Fsawhcd53smhH9MHXPWEysTCPF7AqPV8n7B0FzAgklZefj2y4h81H5lCPqEorfdn
 OrgxnviHuA6zm1DTcZ11majisEaC0BctKDAU6sKMsMarmPFIlwvzPrAFE8rfGU5Gkdg+
 lz0BSj9Ba0/b4eRqKyOrKoe4uCS/9hA1aV9DVA0yNb5/qciKAVU7fQy+27ZYuZLoFpWs
 CmitQQSCZv+mRIoMwmyJBrK+b9dVQD2l4NdLTidF1NVNpqX3/iNVH6diGGYyLWAQFvui
 kNVg==
X-Gm-Message-State: AOAM531ZaR1nOSc/TwCKd7sruqa+LWiK6wWAoHLZ7+1Bbfrbnlj5IEOf
 0dMintF/VGNE2renGhd1cFUMBgIAq4GKTA==
X-Google-Smtp-Source: ABdhPJzpUB56P+P4r03uFMyP2Rl0Rv6DG1wTUo3/c0KP9LtA5bBPpwE4WrVIFn+ygJq7X+iT2/MusQ==
X-Received: by 2002:a2e:9246:: with SMTP id v6mr7742676ljg.47.1591989846693;
 Fri, 12 Jun 2020 12:24:06 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id u6sm1916926ljk.109.2020.06.12.12.24.05
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 12:24:05 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a9so12358831ljn.6
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 12:24:05 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr6689370lji.421.1591989845076; 
 Fri, 12 Jun 2020 12:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200612152205.GA18833@8bytes.org>
In-Reply-To: <20200612152205.GA18833@8bytes.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Jun 2020 12:23:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whtWYyUWP2Us3ZnOQB8i=C6JkVRZ7EG74rVY3K2v-gKaQ@mail.gmail.com>
Message-ID: <CAHk-=whtWYyUWP2Us3ZnOQB8i=C6JkVRZ7EG74rVY3K2v-gKaQ@mail.gmail.com>
Subject: Re: [git pull] iommu: Move Intel and AMD drivers to a subdirectory
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu <iommu@lists.linux-foundation.org>,
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

On Fri, Jun 12, 2020 at 8:22 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> I am not sure it is the right time to send this.

Looks good to me. Any time a directory starts to have a lot of
filenames with a particular prefix, moving them deeper like this seems
to make sense. And doing it just before the -rc1 release and avoiding
unnecessary conflicts seems like the right time too.

So pulled.

Looking at it, it might even be worth moving the Kconfig and Makefile
details down to the intel/amd subdirectories, and have them be
included from the main iommu ones? But that's up to you.

Thanks,

            Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
