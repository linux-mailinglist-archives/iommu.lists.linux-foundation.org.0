Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 205301A2085
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:00:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45E4687E6C;
	Wed,  8 Apr 2020 12:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCtzAparID1j; Wed,  8 Apr 2020 11:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D0978789D;
	Wed,  8 Apr 2020 11:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E798C0177;
	Wed,  8 Apr 2020 11:59:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5625C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 11:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F2F585F44
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 11:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhbEK4IAW0fK for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:59:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D241085D7E
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=D4AVwc5A5TrYE1qiofwcyRs9OblgHBTIRND69C8WOt0=; b=QxIpR9YcW4zlQv0D1PVx1O4w+e
 6AoH6P9DiQVnTVyvjUFva7uacxcWbVMzi8tT0sThE3M71M9cEiBynkFmchCvGJciEPmeo3/uQvlYR
 wtFUjR78EFF5ZyjMMkVUsanIFNIoeODac3xPuGtXF4l5LbiIBWKxhIDjLLLc1Q/GLriiDWQze3R+Q
 HzQxNu0emx30OMndXqf/TY05OZsMHUiUKaWMhp5bxRFdmw1Sri71kup0Kj2ZHNawF6DygdV6PDlKu
 t+Fxg7riz+HXeU7gVyNlLyFQTkfoS6xNo8kPMIJc0+vSNMB1EinNIuq4wvueXomTQU22Nkr4yCLgo
 zR0nVTaA==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Mf-0001Xh-5a; Wed, 08 Apr 2020 11:59:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: decruft the vmalloc API
Date: Wed,  8 Apr 2020 13:58:58 +0200
Message-Id: <20200408115926.1467567-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Hi all,

Peter noticed that with some dumb luck you can toast the kernel address
space with exported vmalloc symbols.

I used this as an opportunity to decruft the vmalloc.c API and make it
much more systematic.  This also removes any chance to create vmalloc
mappings outside the designated areas or using executable permissions
from modules.  Besides that it removes more than 300 lines of code.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git sanitize-vmalloc-api

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/sanitize-vmalloc-api
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
