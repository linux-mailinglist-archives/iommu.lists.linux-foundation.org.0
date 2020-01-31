Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737A14EEBC
	for <lists.iommu@lfdr.de>; Fri, 31 Jan 2020 15:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8CA0087196;
	Fri, 31 Jan 2020 14:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtloJ8vE1uql; Fri, 31 Jan 2020 14:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2FBF487694;
	Fri, 31 Jan 2020 14:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19D66C0171;
	Fri, 31 Jan 2020 14:48:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F20DDC0171
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 14:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB0C887694
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 14:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRZu0PGlklbT for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 14:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 38A9087196
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 14:48:06 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z9so6776640oth.5
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 06:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U30xAUhq9GlK3veoTCP1Aa46ad7I+mdTGkPtxq4XRnk=;
 b=GGUgZrA4CFAgGuGv42tlyLlpH9IVKcQwtU7RjJl1VclBDO6ElU65zqp/hIUpKJaIhD
 dFXD8WdLYIh42rN2FhkHIovIP/OWMEanVnYmJNNWIfiWDTeBa8AXbSDel1Wf4GhmvCE2
 LcCD2WNF9vW2rhjUTO7xZpLuvoDZo2oVJkez/Mvsj3hmTb8DFPbfXcGzzCX1aHgYV30g
 GJ+lfYiKlckfJLKJSH5icsrzbscCy39iY5OMgWKCsHr98kHVdwnL6DtEPYmIXK50euox
 ABAjrK8hUjSrmt/d3fZ36F2vnLLtQi97JvThAppnSoJZI1Q6RxZljDCqpgoNTBTzjSkS
 FxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U30xAUhq9GlK3veoTCP1Aa46ad7I+mdTGkPtxq4XRnk=;
 b=LPiYJSpdtnw7CNDdqD+QaTZkm8aX7pTaHgDrXANvf736eK2dFbDn3zxwA2+xEt6PAk
 WE/ccddkdhO7BIQm1RjuGttkJ+GfigzUDzgozlJklyMBgSr9eb6waAS9FsrvPXsxHfs/
 l+LaDD1qx/VUZZgcKX1Zn2KnIeSpmeB53DxvIjsfmigMoJWzB/5iI5e7YfiYDEjktPEn
 poXFZGzp10mU8EXbAXxrCiMnV1wcGYuDesGYsa/zSv0VMrABBmsSc8FYTLWGLXILlEV3
 somY7lzNp53aoGAtxjuPr/yEfEHm+vYhHd2FzRvPjuBbeTwhgDXK27DdX4fy5u5BOouf
 D6kQ==
X-Gm-Message-State: APjAAAVw/+b1GBoo/3aeky6iIGpy09C/PMJRR7syEnS10ANFjUGPeapK
 8Lzt4tfq1iIK/x2RslWH0ceKfkJVDZ/QECHzFVvB5bhD1po=
X-Google-Smtp-Source: APXvYqwVjlTzsTOkRDlxl6dsFym7bSPIOlDXZpEuWzoJQFEezSQLJssyXCbviCKGqUM+Fsi1PaYEN726epNCjfGBPmI=
X-Received: by 2002:a81:7cd7:: with SMTP id x206mr7960111ywc.466.1580481760596; 
 Fri, 31 Jan 2020 06:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20200130191049.190569-1-edumazet@google.com>
 <e0a0ffa9-3721-4bac-1c8f-bcbd53d22ba1@arm.com>
 <CANn89i+fRqeSAz9eH8f2ujzBWSLUXw0eTT=tK=eNj8hL71MiFQ@mail.gmail.com>
 <f870ae85-995f-7866-ebbd-95b89ca28dc5@arm.com>
In-Reply-To: <f870ae85-995f-7866-ebbd-95b89ca28dc5@arm.com>
Date: Fri, 31 Jan 2020 06:42:28 -0800
Message-ID: <CANn89iKfA+yPHiL4R7-jkewwhDgM6jkwhW5o9H=VL9CnyBikhw@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: dynamic allocation of hash table
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <jroedel@suse.de>, Eric Dumazet <eric.dumazet@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
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
From: Eric Dumazet via iommu <iommu@lists.linux-foundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Jan 31, 2020 at 4:30 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> ...and when that represents ~5% of the total system RAM it is a *lot*
> less reasonable than even 12KB. As I said, it's great to make a debug
> option more efficient such that what it observes is more representative
> of the non-debug behaviour, but it mustn't come at the cost of making
> the entire option unworkable for other users.
>

Then I suggest you send a patch to reduce PREALLOC_DMA_DEBUG_ENTRIES
because having 65536 preallocated entries consume 4 MB of memory.

Actually this whole attempt to re-implement slab allocations in this
file is suspect.

Do not get me wrong, but if you really want to run linux on a 16MB host,
I guess you need to add CONFIG_BASE_SMALL all over the places,
not only in this kernel/dma/debug.c file.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
