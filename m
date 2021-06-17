Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B60953ABD70
	for <lists.iommu@lfdr.de>; Thu, 17 Jun 2021 22:30:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458A7842BB;
	Thu, 17 Jun 2021 20:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBhNke09npG3; Thu, 17 Jun 2021 20:30:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 756E5842D0;
	Thu, 17 Jun 2021 20:30:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32412C0022;
	Thu, 17 Jun 2021 20:30:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09A47C000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E05A0842CC
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmSmKVPunJJS for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 20:30:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F029840F9
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:30:53 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9B4521B1C;
 Thu, 17 Jun 2021 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623961850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MrOSZdFOt9wTUVyZxzKZ+9qRk1GhEPDQuhCcMSdan0=;
 b=Nzml9LQc5a54Z6G6NC24xdoLvkPsFpO/is604opqVvgX7yV9TeF13FFC+5J8sv4fSo2JR8
 ZezTUrpJe6WMXC9X7cmUOKL12NEs7iEo5p/kYbX+gYyRfSITZoHufdpn9VkFd7ki/Sg96f
 MbB0pLsV6iBvUhdOca9xfx47z6t7ueI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623961850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MrOSZdFOt9wTUVyZxzKZ+9qRk1GhEPDQuhCcMSdan0=;
 b=AFKiXakYcmVG5XKv+m6WtjG96wImTTAwKdUtoWj6WX9fuBYwl/6wkJQnxqIqUOyKcjnnVV
 gwQh/Dw8CKd88WDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 50E7A118DD;
 Thu, 17 Jun 2021 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623961850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MrOSZdFOt9wTUVyZxzKZ+9qRk1GhEPDQuhCcMSdan0=;
 b=Nzml9LQc5a54Z6G6NC24xdoLvkPsFpO/is604opqVvgX7yV9TeF13FFC+5J8sv4fSo2JR8
 ZezTUrpJe6WMXC9X7cmUOKL12NEs7iEo5p/kYbX+gYyRfSITZoHufdpn9VkFd7ki/Sg96f
 MbB0pLsV6iBvUhdOca9xfx47z6t7ueI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623961850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MrOSZdFOt9wTUVyZxzKZ+9qRk1GhEPDQuhCcMSdan0=;
 b=AFKiXakYcmVG5XKv+m6WtjG96wImTTAwKdUtoWj6WX9fuBYwl/6wkJQnxqIqUOyKcjnnVV
 gwQh/Dw8CKd88WDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id waNDEfqwy2ASDgAALh3uQQ
 (envelope-from <jroedel@suse.de>); Thu, 17 Jun 2021 20:30:50 +0000
Date: Thu, 17 Jun 2021 22:30:48 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] iommu/vt-d: Fix W=1 clang warning in intel/perf.c
Message-ID: <YMuw+LtM/B1QTTJI@suse.de>
References: <20210617145339.2692-1-joro@8bytes.org>
 <CAKwvOd=8jUsRFKg6+sqq2-DakbRBGR6Z6mR_smuxp+cMEmCHLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=8jUsRFKg6+sqq2-DakbRBGR6Z6mR_smuxp+cMEmCHLw@mail.gmail.com>
Cc: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Thu, Jun 17, 2021 at 10:16:50AM -0700, Nick Desaulniers wrote:
> On Thu, Jun 17, 2021 at 7:54 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > From: Joerg Roedel <jroedel@suse.de>
> >
> > Fix this warning when compiled with clang and W=1:
> >
> >         drivers/iommu/intel/perf.c:16: warning: Function parameter or member 'latency_lock' not described in 'DEFINE_SPINLOCK'
> >         drivers/iommu/intel/perf.c:16: warning: expecting prototype for perf.c(). Prototype was for DEFINE_SPINLOCK() instead
> 
> I think these warnings are actually produced by kernel-doc? (not clang)

Will kernel-doc check automatically when COMPILER=clang is set and W=1?
Because I did not explicitly enable any kernel-doc checks.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
