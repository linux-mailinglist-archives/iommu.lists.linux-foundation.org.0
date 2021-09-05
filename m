Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE4401100
	for <lists.iommu@lfdr.de>; Sun,  5 Sep 2021 19:24:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC678402BF;
	Sun,  5 Sep 2021 17:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17El9Hvlk26U; Sun,  5 Sep 2021 17:24:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7F09E401F3;
	Sun,  5 Sep 2021 17:24:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49E9BC001F;
	Sun,  5 Sep 2021 17:24:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76C78C000E;
 Sun,  5 Sep 2021 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E6D340369;
 Sun,  5 Sep 2021 17:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ferrjdfvBWoB; Sun,  5 Sep 2021 17:24:25 +0000 (UTC)
X-Greylist: delayed 00:28:24 by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B5674035A;
 Sun,  5 Sep 2021 17:24:25 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mMvFw-001XlV-Bq; Sun, 05 Sep 2021 16:44:32 +0000
Date: Sun, 5 Sep 2021 16:44:32 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v13 03/13] file: Export receive_fd() to modules
Message-ID: <YTTz8PAcRSXMAdJ+@zeniv-ca.linux.org.uk>
References: <20210831103634.33-1-xieyongji@bytedance.com>
 <20210831103634.33-4-xieyongji@bytedance.com>
 <20210905115642-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210905115642-mutt-send-email-mst@kernel.org>
Cc: kvm@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 will@kernel.org, corbet@lwn.net, willy@infradead.org, hch@infradead.org,
 Xie Yongji <xieyongji@bytedance.com>, dan.carpenter@oracle.com,
 sgarzare@redhat.com, xiaodong.liu@intel.com, linux-fsdevel@vger.kernel.org,
 mika.penttila@nextfour.com, stefanha@redhat.com, songmuchun@bytedance.com,
 axboe@kernel.dk, zhe.he@windriver.com, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bcrl@kvack.org, netdev@vger.kernel.org,
 joe@perches.com, robin.murphy@arm.com
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

On Sun, Sep 05, 2021 at 11:57:22AM -0400, Michael S. Tsirkin wrote:
> On Tue, Aug 31, 2021 at 06:36:24PM +0800, Xie Yongji wrote:
> > Export receive_fd() so that some modules can use
> > it to pass file descriptor between processes without
> > missing any security stuffs.
> > 
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> 
> This needs some acks from fs devels.
> Viro?

*shrug*

I still think that having random ioctls messing with descriptor table
is a bad idea, and I'm not thrilled with the way it's currently
factored, but we can change that later.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
