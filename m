Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 53984351475
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 13:28:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB77084A43;
	Thu,  1 Apr 2021 11:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkqtoqlNwafW; Thu,  1 Apr 2021 11:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9614849ED;
	Thu,  1 Apr 2021 11:28:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB888C000A;
	Thu,  1 Apr 2021 11:28:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E2A8C000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 11:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89AF640554
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 11:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55lfCjPAKxxe for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 11:28:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2301400CE
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 11:28:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2E66152D;
 Thu,  1 Apr 2021 04:28:19 -0700 (PDT)
Received: from [10.57.24.208] (unknown [10.57.24.208])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1E573F694;
 Thu,  1 Apr 2021 04:28:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] tracing: Use pr_crit() instead of long fancy messages
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Steven Rostedt <rostedt@goodmis.org>
References: <20210331093104.383705-1-geert+renesas@glider.be>
 <20210331093104.383705-3-geert+renesas@glider.be>
 <20210331094007.77aa5194@gandalf.local.home>
 <CAMuHMdUvgRiYfsVOJdocB3peLhnDWe=Kn1MLW64sh8zpd2XoLA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b8dba57b-860b-0bd4-2ca0-e8f2e26571bd@arm.com>
Date: Thu, 1 Apr 2021 12:28:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUvgRiYfsVOJdocB3peLhnDWe=Kn1MLW64sh8zpd2XoLA@mail.gmail.com>
Content-Language: en-GB
Cc: Petr Mladek <pmladek@suse.com>, Marco Elver <elver@google.com>,
 Linux Embedded <linux-embedded@vger.kernel.org>,
 John Ogness <john.ogness@linutronix.de>, Will Deacon <will@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Gary R Hook <gary.hook@amd.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>
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

On 2021-04-01 10:39, Geert Uytterhoeven wrote:
> Hi Steven,
> 
> On Wed, Mar 31, 2021 at 3:40 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>> On Wed, 31 Mar 2021 11:31:03 +0200
>> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>
>>> This reduces kernel size by ca. 0.5 KiB.
>>
>> If you are worried about size, disable tracing and it will go away
>> entirely. 0.5KiB is a drop in the bucket compared to what tracing adds in
>> size overhead.
> 
> Fair enough for this particular case, as tracing can be disabled.

I think the same argument can be applied to patch #1 - it's hard to 
imaging anyone debugging an IOMMU driver on a system where a few hundred 
bytes makes the slightest bit of difference, and for people not 
debugging IOMMU drivers it should be moot (per the message itself).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
