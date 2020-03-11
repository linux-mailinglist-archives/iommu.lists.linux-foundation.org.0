Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE2181D0F
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 16:58:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 640AA88328;
	Wed, 11 Mar 2020 15:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3wALSS4LTxs; Wed, 11 Mar 2020 15:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B06728822A;
	Wed, 11 Mar 2020 15:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DB52C1D8E;
	Wed, 11 Mar 2020 15:58:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B9B5C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7640184B01
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOv06WRnc8Ie for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F10C849DF
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:58:17 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id o10so2910241ljc.8
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsEQHYE0y+y5d13UNRJfwErW7gYfQrzha/Ji2nKV2Bs=;
 b=f70eOhsn4kSqi3NuTTLjoO+0Wc9NXo5nwZCyVCcqLPSEsncA2DAh2CuIxREXn5KSOl
 OHpNolXQuH5Jg2g/thOX9CzTzmWGZL/Q5/P36kufFk26yh34tjg9B5qfWo5ztc56e4u1
 SdIutscSxzCZADCUL9zQUcpJawXtUAEAdYyog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsEQHYE0y+y5d13UNRJfwErW7gYfQrzha/Ji2nKV2Bs=;
 b=IFZo9wa0jlwXv6Ohy2rzGTDC86++1sAREr1ZhYlv9wcVqHJj00c5OpZ6hp0lhof/V8
 XpPXlzXf4U61SkKQqEDVLd+y1LhSdeYQ2jagRAiBmfhFOL0k2xenmvAB58GETdSyp9Q4
 2CWCogv8aRuxzvQ/tE81PSN0L3cN2riFKUx6xovYN9ZwfozL113MsRHBoJgw9j9Ih1J+
 uMkL+NE+JJYuoTjyN681Kst5JjXjW6Oy4nS/kyCbeL8I7VvId7ltpjauVMBSIW3OPSVo
 aZRG8KzJJ1Yddt0W2ObgUDyHKS0CqUQz81LiTGCGiQeaeN9qfZ2Kq2sYoDFZnkeQg7y0
 0zHQ==
X-Gm-Message-State: ANhLgQ2fkhVQoJKqyDcWYgkQStZf8G2AkXSwhzDzsQ0X3A7GfMXPx6ca
 PvGgHZlo2XFokerbkMNKSnvHWRfIHIfvkg==
X-Google-Smtp-Source: ADFU+vvZtqJ9LNtK2OGI/px9aSgVSFf89ep8we73L+qOaCrA0fzoS7iM5M/si5nXrZDkI2Z879Zosw==
X-Received: by 2002:a2e:1654:: with SMTP id 20mr2597218ljw.82.1583942294965;
 Wed, 11 Mar 2020 08:58:14 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id j8sm25780884lfe.34.2020.03.11.08.58.13
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 08:58:14 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id b13so2157076lfb.12
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 08:58:13 -0700 (PDT)
X-Received: by 2002:a19:6144:: with SMTP id m4mr2504756lfk.192.1583942292581; 
 Wed, 11 Mar 2020 08:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com> <20200311154328.GA24044@lst.de>
 <19498990-fb97-b739-cd19-6a6415ba88a2@gmx.com>
In-Reply-To: <19498990-fb97-b739-cd19-6a6415ba88a2@gmx.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 08:57:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=widmu42C4eTQ9uDM+njZE1s5ARmx7E+1SHH1XznTFOwyg@mail.gmail.com>
Message-ID: <CAHk-=widmu42C4eTQ9uDM+njZE1s5ARmx7E+1SHH1XznTFOwyg@mail.gmail.com>
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu <iommu@lists.linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
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

On Wed, Mar 11, 2020 at 8:53 AM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> I'm not sure I can call or do anything because the system is dead and
> I'm looking at the kernel panic message. The console is dead. The root
> file system is not yet mounted. Initrd can't be loaded either. I have no
> COM port/console. I have no debugging abilities whatsoever. I can only
> compile kernels and try running them.

Christoph just wanted you to use the image you booted with - you can
do it while using a working and entirely unrealted kernel.

But I think Christoph's second email was right on the money: the
platform device code used to (accidentally) always use that special
kmalloc()'ed memory, and the "always use kfree() to release" then
happened to work.

But with the change, platform devices use that allocations inside the
platform device itself, and the kfree() now does bad things and
corrupts the kmalloc lists.

So that finally makes sense of why that commit would cause odd
problems for you. I'm actually surprised it didn't cause problems for
others, but it's an error path, and presumably it normally never
triggers.

                Linus

              Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
