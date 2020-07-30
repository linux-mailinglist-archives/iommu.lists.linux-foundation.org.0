Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD22329B1
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 03:52:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BB5988499;
	Thu, 30 Jul 2020 01:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RGny-RWCVb6; Thu, 30 Jul 2020 01:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 93C818815C;
	Thu, 30 Jul 2020 01:52:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 868EFC004D;
	Thu, 30 Jul 2020 01:52:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA9A8C004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6176869BA
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B18Rb-1xgUG0 for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 01:52:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C429886937
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596073957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wr/vxuRMCyMaqxtO9q8uf3t1cVc0k0F6Dgt7vG6jHBM=;
 b=eGo2+WlcclXsDpnazLCvnBByb23LW99BZpmC8+GbcFaaMdCnm3RJysRyRZDMYxvP+4tVpw
 q8jIl6iUk6wAYHYogVIU6QUKy1gJ6Hpy9kiGmJN1bv2Cq+9uqUmpt+Zd2d7vA7mA5YJMD7
 qzb8bs++e/uwmP2bvpX1dwq6UnoX26g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-29YBKjvJP4OrLqv9mdWq_A-1; Wed, 29 Jul 2020 21:52:35 -0400
X-MC-Unique: 29YBKjvJP4OrLqv9mdWq_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F7459;
 Thu, 30 Jul 2020 01:52:29 +0000 (UTC)
Received: from localhost (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3136179C;
 Thu, 30 Jul 2020 01:52:27 +0000 (UTC)
Date: Thu, 30 Jul 2020 09:52:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 09/15] memblock: make for_each_memblock_type() iterator
 private
Message-ID: <20200730015221.GI14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-10-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-10-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
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

On 07/28/20 at 08:11am, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> for_each_memblock_type() is not used outside mm/memblock.c, move it there
> from include/linux/memblock.h
> 
> ---
>  include/linux/memblock.h | 5 -----
>  mm/memblock.c            | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 017fae833d4a..220b5f0dad42 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -532,11 +532,6 @@ static inline unsigned long memblock_region_reserved_end_pfn(const struct memblo
>  	     region < (memblock.memblock_type.regions + memblock.memblock_type.cnt);	\
>  	     region++)
>  
> -#define for_each_memblock_type(i, memblock_type, rgn)			\
> -	for (i = 0, rgn = &memblock_type->regions[0];			\
> -	     i < memblock_type->cnt;					\
> -	     i++, rgn = &memblock_type->regions[i])
> -
>  extern void *alloc_large_system_hash(const char *tablename,
>  				     unsigned long bucketsize,
>  				     unsigned long numentries,
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 39aceafc57f6..a5b9b3df81fc 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -129,6 +129,11 @@ struct memblock memblock __initdata_memblock = {
>  	.current_limit		= MEMBLOCK_ALLOC_ANYWHERE,
>  };
>  
> +#define for_each_memblock_type(i, memblock_type, rgn)			\
> +	for (i = 0, rgn = &memblock_type->regions[0];			\
> +	     i < memblock_type->cnt;					\
> +	     i++, rgn = &memblock_type->regions[i])
> +

Reviewed-by: Baoquan He <bhe@redhat.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
