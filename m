Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A017F547
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 11:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF11B203A7;
	Tue, 10 Mar 2020 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Gx-OYSOvGDH; Tue, 10 Mar 2020 10:44:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E41FD203D3;
	Tue, 10 Mar 2020 10:44:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D80A1C1D8E;
	Tue, 10 Mar 2020 10:44:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1A1DC0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E0F5E8797A
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsG01H+Phjmc for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 10:44:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3C7E38796C
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 10:44:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 54EDB364; Tue, 10 Mar 2020 11:44:38 +0100 (CET)
Date: Tue, 10 Mar 2020 11:44:37 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] iommu/vt-d: quirk_ioat_snb_local_iommu: replace
 WARN_TAINT with pr_warn + add_taint
Message-ID: <20200310104436.GC3794@8bytes.org>
References: <20200309182510.373875-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309182510.373875-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Mon, Mar 09, 2020 at 07:25:10PM +0100, Hans de Goede wrote:
> Quoting from the comment describing the WARN functions in
> include/asm-generic/bug.h:
> 
>  * WARN(), WARN_ON(), WARN_ON_ONCE, and so on can be used to report
>  * significant kernel issues that need prompt attention if they should ever
>  * appear at runtime.
>  *
>  * Do not use these macros when checking for invalid external inputs
> 
> The (buggy) firmware tables which the dmar code was calling WARN_TAINT
> for really are invalid external inputs. They are not under the kernel's
> control and the issues in them cannot be fixed by a kernel update.
> So logging a backtrace, which invites bug reports to be filed about this,
> is not helpful.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=701847
> Fixes: 556ab45f9a77 ("ioat2: catch and recover from broken vtd configurations v6")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/iommu/intel-iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
