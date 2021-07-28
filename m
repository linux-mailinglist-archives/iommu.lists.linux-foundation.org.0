Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2D3D9335
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 18:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFED56088C;
	Wed, 28 Jul 2021 16:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvsHGcY7_ve4; Wed, 28 Jul 2021 16:28:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E3B626059F;
	Wed, 28 Jul 2021 16:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBF12C0022;
	Wed, 28 Jul 2021 16:28:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4B6CC000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0E136088C
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q685NOwDIHSr for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 16:27:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58CA06059F
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 16:27:57 +0000 (UTC)
Received: from nazgul.tnic (unknown [109.121.183.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F24F1EC0527;
 Wed, 28 Jul 2021 18:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1627489669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=GOEYhGPYQ4YUbo4gftj4JX0Uz5V/Qj9S6dris+AXSaA=;
 b=LxjG3gFIJCDuOQDGzY+hiG0vN+dfpBr7Vq5w2ORdpOETiJfx6X9JMDFJJMxIan0ujoNNw7
 KMi/vJ5Nq5Vi/Nq5x7JcXDHRAXe8ptcsnGwT9j1ZZa1hhOAXVDNeta9RonTrMrxsR3lvLV
 KIVjknjki6FEc0QGw1JCe7AU529aFu0=
Date: Wed, 28 Jul 2021 18:28:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/11] mm: Introduce a function to check for
 virtualization protection features
Message-ID: <YQGFh3BlaD8RAEBz@nazgul.tnic>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <cbc875b1d2113225c2b44a2384d5b303d0453cf7.1627424774.git.thomas.lendacky@amd.com>
 <YQFY5/cq2thyHzUe@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQFY5/cq2thyHzUe@infradead.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-efi@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, linuxppc-dev@lists.ozlabs.org
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

On Wed, Jul 28, 2021 at 02:17:27PM +0100, Christoph Hellwig wrote:
> So common checks obviously make sense, but I really hate the stupid
> multiplexer.  Having one well-documented helper per feature is much
> easier to follow.

We had that in x86 - it was called cpu_has_<xxx> where xxx is the
feature bit. It didn't scale with the sheer amount of feature bits that
kept getting added so we do cpu_feature_enabled(X86_FEATURE_XXX) now.

The idea behind this is very similar - those protected guest flags
will only grow in the couple of tens range - at least - so having a
multiplexer is a lot simpler, I'd say, than having a couple of tens of
helpers. And those PATTR flags should have good, readable names, btw.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
