Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A89121058
	for <lists.iommu@lfdr.de>; Mon, 16 Dec 2019 18:03:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50D3E21F76;
	Mon, 16 Dec 2019 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxNZ85NqC3O8; Mon, 16 Dec 2019 17:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF9CF22053;
	Mon, 16 Dec 2019 17:03:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D93ADC077D;
	Mon, 16 Dec 2019 17:03:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161F0C077D
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 17:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 04EC68809E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltnFQfjd97mo for <iommu@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 17:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B5581880E2
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 17:03:50 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id e10so7603675ljj.6
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 09:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIdISGJGzaJQCx+QFJwKYDn4eFwlu/KmTgZK+KGXtHQ=;
 b=FisnqkZLHGXU1116n34+W+++BJdXYXOirmyu3COj1Poy7sgqkkMzkwIqNqD2BJgXgp
 7bJbstoeV3IIxqy5UfVfnC6h1ipDwDqg3zT7NIwOmZblVCoykHaLLgUB9CCSMHXcX6wr
 99dslGhvIxyUYoXqIGnH5vu5CdG8apoTfqsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIdISGJGzaJQCx+QFJwKYDn4eFwlu/KmTgZK+KGXtHQ=;
 b=DPCOBIOCC443i73CBdZyhmGc8Qd4CMnx5xz2h4vgwfTv8iPBzCWqKf3Hh9bBWIDGcB
 1TEG+zasKVHxTcBLTJU7Q2zol6A/YocC7UBeUZ7UEui1V/i9goSDh+y5vNQvD9NY7KkR
 U/AmNiAKmieAhsJ+8b5ud4aFj+LoZAXseTlW+CTEgEB3C0O+agRCi8Nl7UXZEJ1Kraos
 ClGiv8RpnFpHKgZSSAE5g+cGUSrkmCLLiREsa2w7/45f7mlinr9cB6H4MESRxnvNi6ht
 TmvDDSN8hrhdmcYDpZHLJEhHnx+mVw5ClVD0iljCGXc4qZxzsQzefVZ/wGDrwfKDdvr2
 hD4A==
X-Gm-Message-State: APjAAAVmNVAmA6DjMqK1cgF5LXXtIlmrujcTy/BlhEs6zN9LlXONw+UA
 JedCTJn1TeW1Z36dLtkfXWDxIWacTlqSow==
X-Google-Smtp-Source: APXvYqyDiJ7W/Bgyzbr0n3ewiItyF+1OxZyu37WSRNqnWMXZLJPfzZ10A4TPiSk6gs3hVTYtDHKPng==
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr37781ljc.221.1576515827176;
 Mon, 16 Dec 2019 09:03:47 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id x85sm11446432ljb.20.2019.12.16.09.03.45
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 09:03:46 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id r19so7626251ljg.3
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 09:03:45 -0800 (PST)
X-Received: by 2002:a2e:9ad8:: with SMTP id p24mr84697ljj.148.1576515825433;
 Mon, 16 Dec 2019 09:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20191126102743.3269-1-eric.auger@redhat.com>
 <0DE725CD-01CD-4E01-B817-9CC7F4768FBC@lca.pw>
 <80da76c4-395a-18cc-1ffa-c3a0471921b0@redhat.com>
In-Reply-To: <80da76c4-395a-18cc-1ffa-c3a0471921b0@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Dec 2019 09:03:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi7hqWOGhDopCFojBXm_K+p7Duyxp6Sjy=2HG=LqM8GbA@mail.gmail.com>
Message-ID: <CAHk-=wi7hqWOGhDopCFojBXm_K+p7Duyxp6Sjy=2HG=LqM8GbA@mail.gmail.com>
Subject: Re: [PATCH v3] iommu: fix KASAN use-after-free in
 iommu_insert_resv_region
To: Auger Eric <eric.auger@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 eric.auger.pro@gmail.com
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

On Mon, Dec 16, 2019 at 6:36 AM Auger Eric <eric.auger@redhat.com> wrote:
>On 12/16/19 3:24 PM, Qian Cai wrote:
> >
> > Looks like Joerg is away for a few weeks. Could Andrew or Linus pick up this
> > use-after-free?

I've taken it.

> Note the right version to pick up is the v4, reviewed by Jerry:
> https://www.mail-archive.com/iommu@lists.linux-foundation.org/msg36226.html

Btw, please use lore.kernel.org, it's much more convenient for me
(faster, and a single interface for me so that I don't have to always
figure out "what's the incantation to get the original raw email" that
so many archives make it hard to get).

                   Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
