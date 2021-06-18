Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE273AC581
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 09:57:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F153A60640;
	Fri, 18 Jun 2021 07:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SobTYqfdTfh3; Fri, 18 Jun 2021 07:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 29D6960606;
	Fri, 18 Jun 2021 07:57:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9C48C000B;
	Fri, 18 Jun 2021 07:57:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F7E7C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27360414C0
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="NlPIItnw";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="BWmbx4uW"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="NlPIItnw"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="BWmbx4uW"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9mwViBicbzA for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 07:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5471C40569
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:57:27 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B5AD1FDE7;
 Fri, 18 Jun 2021 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624003044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00PGLHSy+8q9cRmQ8fgZXfLgJHGTi7QAl5WB49PoiEY=;
 b=NlPIItnwAI7vEYQyT3Nf6AimO6jm0zVj46b/cqshLivcLlvrDhFn1TpBPyRB4cwwL/BRI7
 SrQLjSyqffKPvMgRaPwtP7YHRL/nf2rfQZMpyoq9L68ugkg8HeIL4kSnNWvmffzQS/Yln1
 hxvOWCC6jp5yTgkVoWer1VVCK+kp1/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624003044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00PGLHSy+8q9cRmQ8fgZXfLgJHGTi7QAl5WB49PoiEY=;
 b=BWmbx4uWUUSAHrzr4+MS4N6T7M2PNVfdBol3/YMZzHBXWQqKw/6q7LVz0R3JBs3mH/85nE
 Y/GtZbc80bG/CEDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1EB6E118DD;
 Fri, 18 Jun 2021 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624003044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00PGLHSy+8q9cRmQ8fgZXfLgJHGTi7QAl5WB49PoiEY=;
 b=NlPIItnwAI7vEYQyT3Nf6AimO6jm0zVj46b/cqshLivcLlvrDhFn1TpBPyRB4cwwL/BRI7
 SrQLjSyqffKPvMgRaPwtP7YHRL/nf2rfQZMpyoq9L68ugkg8HeIL4kSnNWvmffzQS/Yln1
 hxvOWCC6jp5yTgkVoWer1VVCK+kp1/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624003044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00PGLHSy+8q9cRmQ8fgZXfLgJHGTi7QAl5WB49PoiEY=;
 b=BWmbx4uWUUSAHrzr4+MS4N6T7M2PNVfdBol3/YMZzHBXWQqKw/6q7LVz0R3JBs3mH/85nE
 Y/GtZbc80bG/CEDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mCyyBeRRzGCGVAAALh3uQQ
 (envelope-from <jroedel@suse.de>); Fri, 18 Jun 2021 07:57:24 +0000
Date: Fri, 18 Jun 2021 09:57:22 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] iommu/vt-d: Fix W=1 clang warning in intel/perf.c
Message-ID: <YMxR4ggRGZQZbiz1@suse.de>
References: <20210617145339.2692-1-joro@8bytes.org>
 <CAKwvOd=8jUsRFKg6+sqq2-DakbRBGR6Z6mR_smuxp+cMEmCHLw@mail.gmail.com>
 <YMuw+LtM/B1QTTJI@suse.de>
 <32f14288-315a-b75d-913b-2fc6a16cd748@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32f14288-315a-b75d-913b-2fc6a16cd748@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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

On Thu, Jun 17, 2021 at 01:51:24PM -0700, Nathan Chancellor wrote:
> kernel-doc is run automatically with W=1, regardless of gcc versus clang.

I see, thanks. Will update the commit message.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
