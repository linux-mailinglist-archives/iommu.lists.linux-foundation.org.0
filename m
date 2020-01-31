Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F814EBC7
	for <lists.iommu@lfdr.de>; Fri, 31 Jan 2020 12:33:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CCF1869EB;
	Fri, 31 Jan 2020 11:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9EKvxIuTKKu; Fri, 31 Jan 2020 11:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B043E869EC;
	Fri, 31 Jan 2020 11:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98002C1D87;
	Fri, 31 Jan 2020 11:33:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC766C0171
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E3EE7869EC
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 11:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYdmTRruQdR7 for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 11:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B93E7869EB
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 11:33:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9C2106F;
 Fri, 31 Jan 2020 03:33:53 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56053F67D;
 Fri, 31 Jan 2020 03:33:51 -0800 (PST)
Subject: Re: [PATCH] dma-debug: dynamic allocation of hash table
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200130191049.190569-1-edumazet@google.com>
 <e0a0ffa9-3721-4bac-1c8f-bcbd53d22ba1@arm.com>
 <CAMuHMdVSyD62nvRmN-v6CbJ2UyqH=d7xdVeCD8_X5us+mvCXUQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a305bd1f-8142-6557-4228-aae10c5114e1@arm.com>
Date: Fri, 31 Jan 2020 11:33:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVSyD62nvRmN-v6CbJ2UyqH=d7xdVeCD8_X5us+mvCXUQ@mail.gmail.com>
Content-Language: en-GB
Cc: Joerg Roedel <jroedel@suse.de>, Eric Dumazet <eric.dumazet@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-01-31 9:06 am, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Fri, Jan 31, 2020 at 12:46 AM Robin Murphy <robin.murphy@arm.com> wrote:
>> On 2020-01-30 7:10 pm, Eric Dumazet via iommu wrote:
>>> Increasing the size of dma_entry_hash size by 327680 bytes
>>> has reached some bootloaders limitations.
>>
>> [ That might warrant some further explanation - I don't quite follow how
>> this would relate to a bootloader specifically :/ ]
> 
> Increasing the size of a static array increases kernel size.
> Some (all? ;-) bootloaders have limitations on the maximum size of a
> kernel image they can boot (usually something critical gets overwritten
> when handling a too large image).  While boot loaders can be fixed and
> upgraded, this is usually much more cumbersome than updating the
> kernel.

Ah, OK - I'm all too familiar with bootloaders having image size limits, 
but I'm also used to implicitly-initialised statics being collected into 
a runtime-initialised .bss section, so I hadn't realised that there 
might still be platforms where that space is actually allocated in the 
image at link-time.

> Besides, a static array always consumes valuable unswapable memory,
> even when the feature would not be used (e.g. disabled by a command
> line option).

Indeed, and that alone might have been a reasonable rationale for the 
patch - I was merely querying the wording of the commit message, not its 
intent :)

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
