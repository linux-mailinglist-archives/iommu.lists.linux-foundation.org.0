Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB19260ADE
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 08:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2EABF871C3;
	Tue,  8 Sep 2020 06:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lchuyUsI568n; Tue,  8 Sep 2020 06:23:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB1A6871BA;
	Tue,  8 Sep 2020 06:23:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99209C0051;
	Tue,  8 Sep 2020 06:23:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95CC3C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 06:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 82308856B7
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 06:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAsyz4JA9KS5 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 06:23:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7A0D8853E6
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 06:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sksp/t0ni/xrmSuCxSHeJAbkuuheoDez0O8NIcBsyNY=; b=m0E3zr9AelfXyWNRedxJdmPxni
 /5kOwchSrWI2cUO0Kcaakoe0rgd0DMbjZelgTJTiAXThC5QLC8QCvHTgL6y+HhaqjWuPx5Ywqh8wI
 ClsQw8MY+LH5Bwa2ThIPoe7KR1wxLxnTwgOTS+315FS2eIzyUGq+YZUbfa/dnPAC9XQPMWu+uURuM
 xfoswb7HyU5gjU4Yf6JXFCFBaTq8VqvMe0lozrt4izVdTS7WXAV6d3Ox3GLZh2VnLVN+XuLZUVDGO
 fvlfFMIlwEzcWsF/F3Y8EDDplTYAfXs718yKVGEMySswnjnCgp6u3Y3Ms8p58Xc92B/UVOOQMx9vM
 uUAupsNA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFX2M-0006nR-W4; Tue, 08 Sep 2020 06:23:27 +0000
Date: Tue, 8 Sep 2020 07:23:26 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH V2 5/5] DO NOT MERGE: iommu: disable list appending in
 dma-iommu
Message-ID: <20200908062326.GB20774@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
 <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
 <20200908053619.GA15418@infradead.org>
 <20200908055510.GA19078@infradead.org>
 <9655fdc9-6ea0-e4c1-e104-a9a8981ecb1e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9655fdc9-6ea0-e4c1-e104-a9a8981ecb1e@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Tom Murphy <murphyt7@tcd.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

On Tue, Sep 08, 2020 at 02:04:53PM +0800, Lu Baolu wrote:
> Do you mind telling where can I find Marek's series?

[PATCH v10 00/30] DRM: fix struct sg_table nents vs. orig_nents misuse

on various lists including the iommu one.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
