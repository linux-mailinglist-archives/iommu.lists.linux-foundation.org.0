Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 559244663A2
	for <lists.iommu@lfdr.de>; Thu,  2 Dec 2021 13:26:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C092A83E12;
	Thu,  2 Dec 2021 12:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOug-YZWJrc0; Thu,  2 Dec 2021 12:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BE03983E0E;
	Thu,  2 Dec 2021 12:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FB1BC0030;
	Thu,  2 Dec 2021 12:25:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A1E5C000A
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 12:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33785409F0
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 12:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.cz header.b="qAgWGsgs";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.cz header.b="ygy8WyNy"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKQZpcsVrWYX for <iommu@lists.linux-foundation.org>;
 Thu,  2 Dec 2021 12:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEDAD40531
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 12:25:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D466212B9;
 Thu,  2 Dec 2021 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638447953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrIx4FxLZ15vBR8OhFRI6NkqolHxOQGKVsTXFgnLCBo=;
 b=qAgWGsgshMrO9UnM/+8sSOlYxRa0x1O8XpA8dUD5ZVMGONmJ2RDBkHY6oZHOP/CefUeY2W
 954cBjvCgf3iQ9Fpxo98OPqTwDxSGd46MsfoJM6vU7BOrlGazX/vEuwUWnOFoWTd6XuzaD
 w7H0llUJOCCbq91x7aGxd7WUo+DNpdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638447953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrIx4FxLZ15vBR8OhFRI6NkqolHxOQGKVsTXFgnLCBo=;
 b=ygy8WyNyvVScvOltk0InA2SrhTOtpUcVIav8ZI0IWbEjHGA8DLYGwOXkFQskM4PuCmxvLa
 OJFR6QAwsLLfnrBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2F1313D73;
 Thu,  2 Dec 2021 12:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RdqfLlC7qGEUIAAAMHmgww
 (envelope-from <vbabka@suse.cz>); Thu, 02 Dec 2021 12:25:52 +0000
Message-ID: <3fb4f879-c48b-7f74-c7bd-59ca16c5fe8d@suse.cz>
Date: Thu, 2 Dec 2021 13:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, Christoph Lameter <cl@linux.com>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Pekka Enberg <penberg@kernel.org>
References: <20211201181510.18784-1-vbabka@suse.cz>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2 00/33] Separate struct slab from struct page
In-Reply-To: <20211201181510.18784-1-vbabka@suse.cz>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 x86@kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Vladimir Davydov <vdavydov.dev@gmail.com>, Nitin Gupta <ngupta@vflare.org>,
 Marco Elver <elver@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 patches@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
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

On 12/1/21 19:14, Vlastimil Babka wrote:
> Folks from non-slab subsystems are Cc'd only to patches affecting them, and
> this cover letter.
> 
> Series also available in git, based on 5.16-rc3:
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=slab-struct_slab-v2r2

I have pushed a v3, but not going to resent immediately to avoid unnecessary
spamming, the differences is just that some patches are removed and other
reordered, so the current v2 posting should be still sufficient for on-list
review:

https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=slab-struct_slab-v3r1

patch 29/33 iommu: Use put_pages_list
- removed as this version is broken and Robin Murphy has meanwhile
incorporated it partially to his series:
https://lore.kernel.org/lkml/cover.1637671820.git.robin.murphy@arm.com/

patch 30/33 mm: Remove slab from struct page
- removed and postponed for later as this can be only be applied after the
iommu use of page.freelist is resolved

patch 27/33 zsmalloc: Stop using slab fields in struct page
patch 28/33 bootmem: Use page->index instead of page->freelist
- moved towards the end of series, to further separate the part that adjusts
non-slab users of slab fields towards removing those fields from struct page.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
