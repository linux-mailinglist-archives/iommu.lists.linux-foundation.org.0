Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7620B5B4
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 18:14:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD72585374;
	Fri, 26 Jun 2020 16:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jagkww27T7hE; Fri, 26 Jun 2020 16:14:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B61DF81B8E;
	Fri, 26 Jun 2020 16:14:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A849CC0895;
	Fri, 26 Jun 2020 16:14:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 804DCC016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 16:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C46387DE2
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 16:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKhueI-YC5pL for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 16:14:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D66FD877D1
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 16:14:02 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id DCE73374;
 Fri, 26 Jun 2020 16:13:59 +0000 (UTC)
Date: Fri, 26 Jun 2020 10:13:58 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 00/15] Documentation fixes
Message-ID: <20200626101358.6efc4f8f@lwn.net>
In-Reply-To: <cover.1592895969.git.mchehab+huawei@kernel.org>
References: <cover.1592895969.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, "Peter
 Zijlstra \(Intel\)" <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Ram Pai <linuxram@us.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jan Kara <jack@suse.cz>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Haren Myneni <haren@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jakub Kicinski <kuba@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Alexey Gladkov <gladkov.alexey@gmail.com>,
 Akira Shimahara <akira215corp@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.
 Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
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

On Tue, 23 Jun 2020 09:08:56 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As requested, this is a rebase of a previous series posted on Jan, 15.
> 
> Since then, several patches got merged via other trees or became
> obsolete. There were also 2 patches before that fits better at the
> ReST conversion patchset. So, I'll be sending it on another patch
> series together with the remaining ReST conversions.
> 
> I also added reviews/acks received.
> 
> So, the series reduced from 29 to 15 patches.
> 
> Let's hope b4 would be able to properly handle this one.

Nope.  I don't know what it is about your patch series, but b4 is never
able to put them together.

I've applied the series except for #1, which already went through the -mm
tree.

Thanks,

jon
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
