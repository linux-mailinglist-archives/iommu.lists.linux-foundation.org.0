Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD03D5070
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 00:29:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 351E9401BA;
	Sun, 25 Jul 2021 22:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5K63tEPaaeGx; Sun, 25 Jul 2021 22:29:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 71C9A40286;
	Sun, 25 Jul 2021 22:29:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B32BC000E;
	Sun, 25 Jul 2021 22:29:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6E58C000E
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 22:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF3694039B
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 22:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RR3SRoBZpF4y for <iommu@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 22:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C27D40395
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 22:29:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 824FA60F11
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 22:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627252165;
 bh=LXdv3SNozGddEOtTXiweAPm33gFyubUEqk9QT+fHMHc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NBPZZmLXXECARRRpEYQnILLiWAelyx07J8u147xeLgLnvwVuOuCbSyWtEgjGZdGXZ
 qczGtqvXBsxZc3Az2W3EwEoNOBBYlO16DwuPkJprDfNylmKUSeVQ3oCdothZgb2Bni
 9rQiM6bwtcPjqV3EfCv8OvpNve5f6FFEM6tPO6mUf1oWARwt2aBLkvV4tYPGnS0ifn
 reMmxDr85ZhAAxogPTTL8v3QrLWdyVkGkF5/MmZ6l9GlDyP2q3+tFQJpEqTHYN4Wqj
 lSlGFU29w6nStaab2+shG0nR9K87pYEGuvSnGCORJ80K0d5pqHvRyeMrP6BLDerHKd
 qZfasI1lM/seA==
Received: by mail-ej1-f42.google.com with SMTP id hb6so13472603ejc.8
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 15:29:25 -0700 (PDT)
X-Gm-Message-State: AOAM533Gdr5oykPuObMm54ZKF9jcPQiMPBxDfGkorL9RekVbMqw8FgnM
 abXjIfJBY+zJoY6OjLFgbijZ4PfjpScnQYTVJg==
X-Google-Smtp-Source: ABdhPJwfSEK/zGq4H+iwJok9IKltb7Tkin7X2hIbv0FMn04qW6BMg5NfENWFO8APXBMeuB8xHMIhsh3UlasWyhyEfQE=
X-Received: by 2002:a17:906:95ce:: with SMTP id
 n14mr5509121ejy.130.1627252164182; 
 Sun, 25 Jul 2021 15:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
In-Reply-To: <20210723214031.3251801-4-atish.patra@wdc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 25 Jul 2021 16:29:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKG9xkSAQGkBE8_BEE+O9S+z09M8C9+gWN-58aXEZWqgg@mail.gmail.com>
Message-ID: <CAL_JsqKG9xkSAQGkBE8_BEE+O9S+z09M8C9+gWN-58aXEZWqgg@mail.gmail.com>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
To: Atish Patra <atish.patra@wdc.com>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Tobias Klauser <tklauser@distanz.ch>, Robin Murphy <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Dmitry Vyukov <dvyukov@google.com>
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

On Fri, Jul 23, 2021 at 3:40 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, linux,dma-default is used to reserve a global non-coherent pool
> to allocate memory for dma operations. This can be useful for RISC-V as
> well as the ISA specification doesn't specify a method to modify PMA
> attributes or page table entries to define non-cacheable area yet.
> A non-cacheable memory window is an alternate options for vendors to
> support non-coherent devices. "dma-ranges" must be used in conjunction with
> "linux,dma-default" property to define one or more mappings between device
> and cpu accesible memory regions.

'dma-ranges' applies to buses. And, well, maybe devices when the bus
is not well defined. It is not a reserved-memory property.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
