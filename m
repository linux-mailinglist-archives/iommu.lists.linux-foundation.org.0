Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC323A4667
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 18:22:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8426062C;
	Fri, 11 Jun 2021 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwXtJ1aZQUo6; Fri, 11 Jun 2021 16:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7E30060729;
	Fri, 11 Jun 2021 16:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49451C0024;
	Fri, 11 Jun 2021 16:22:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45000C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DF14404E3
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux-foundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0I4KodvGY7eK for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 16:22:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40C284023D
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 16:22:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i10so9386491lfj.2
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7VLGpzo0pic/uCZ5FLPezepVfzXChJpgysJmVZaFsc=;
 b=J/Dt9jQa1QKH8awC7zPDGpIDCC1B4T52bk/xbJkYWmrsyiPBf1xyBpuuJ6YktX8o19
 OGXWD4ofRJ+1Y/e3NXpAm87lNARcyx+eUZLb2kGvTbni8Z4d4UmVsZbpfpQ1wYz+9Ynn
 Tu2YFuveWjy2F/JCy1EWycl4zSkeUBSU/byuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7VLGpzo0pic/uCZ5FLPezepVfzXChJpgysJmVZaFsc=;
 b=OMGutLqfRn2/Gxv9WlqpzHB5sfzZYTetx3jGsBHM9qn8zYHmcl+wsxLHygGGJpnQte
 PZLGWFZF+WoXFrAlcMkNGzp9X+uzXWiLu/1OsH+KYDTfvRGazqo4o5uzytzRZn5dm5up
 OehiK9YOX88CAaMwQGcNXrhjntQupQ6xXUxj8I5sdnk2iEmjPdX7ZUYuBA+sFog95F3o
 ynQPIF5UrEJVaOFJdgUaL0fJxPFcnq4Sv7eWctytfNHAHXO51k8jUO13yG7QSjONMlh3
 SbkKPsd/34d0t74c6661crP/NmdXn379EEim3Tr9POQxzUP3LiZLwy9XyLM9SS95fKJS
 MmmA==
X-Gm-Message-State: AOAM533XvkACNpONKW8MphU+VTDgGk2cbpM9YaIf3crGuPfNDiXhHmx4
 XMu/MBNeTlby3Gp+1Uebrif6fs57crPHDZWhMSVdBA==
X-Google-Smtp-Source: ABdhPJw7635cweN/06x7tg0m7hPInpeY830Tz4EEF3bAAUlAdry9Wqh1dc7Q7BQ1Fof5Jv6OZNKaDQ==
X-Received: by 2002:a05:6512:3324:: with SMTP id
 l4mr2989714lfe.273.1623428529657; 
 Fri, 11 Jun 2021 09:22:09 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id d23sm630801lfi.4.2021.06.11.09.21.59
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 09:22:01 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id e11so10383782ljn.13
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 09:21:59 -0700 (PDT)
X-Received: by 2002:a2e:c52:: with SMTP id o18mr3611750ljd.411.1623428518600; 
 Fri, 11 Jun 2021 09:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <YDkbCHHBUOmfI59K@Konrads-MacBook-Pro.local>
 <YL7XXNOnbaDgmTB9@atmark-techno.com>
 <2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com> <20210611062153.GA30906@lst.de>
 <YMM8Ua0HMmErLIQg@0xbeefdead.lan>
In-Reply-To: <YMM8Ua0HMmErLIQg@0xbeefdead.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jun 2021 09:21:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxgTB=G7P6KRneAd0s310WYK2NDisXM5P-wsNibgLrQA@mail.gmail.com>
Message-ID: <CAHk-=wgxgTB=G7P6KRneAd0s310WYK2NDisXM5P-wsNibgLrQA@mail.gmail.com>
Subject: Re: swiotlb/caamjr regression (Was: [GIT PULL] (swiotlb)
 stable/for-linus-5.12)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Dominique MARTINET <dominique.martinet@atmark-techno.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Lukas Hartmann <lukas@mntmn.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, jianxiong Gao <jxgao@google.com>
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

On Fri, Jun 11, 2021 at 3:35 AM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> Linus,
>
> Would you be terribly offended if I took your code (s/unsigned
> long/unsigned int), and used Chanho's description of the problem (see below)?

No offense to that at all - that looks like the right solution. See my
answer to Christoph: I do think my patch does the right one, but I
can't test it and my knowledge of the swiotlb code is not complete
enough to really do anything else than "this looks right".

And adding my sign-off to the patch is fine, but I don't necessarily
need the authorship credit - mine was a throw-away patch just looking
at what the bisection report said. All the real effort was by the
reporters (and for the commit message, Bumyong Lee & co).

Finally - looking at the two places that do have that
swiotlb_align_offset(), my reaction is "I don't understand what that
code is doing".

The index does that

        index = find_slots(dev, orig_addr, alloc_size + offset);

so that offset does seem to depend on how the find_slots code works.
Which in turn does use the same dma_get_min_align_mask() thing that
swiotlb_align_offset() uses.  So the offsets do seem to match, but
find_slots(dev() does a lot of stuff that I don't know. so...

IOW, it does reinforce my "I don't know this code AT ALL". Which just
makes me more convinced that I shouldn't get authorship of the patch
because if something goes wrong with it, I can't help.

So at most maybe a "Suggested-by:".

My patch really was based on very little context and "this is the
calculation that makes sense given the other calculations in the
function".

              Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
