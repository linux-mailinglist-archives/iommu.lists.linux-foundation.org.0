Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 03095276EAB
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 12:25:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A977286B72;
	Thu, 24 Sep 2020 10:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QEIlB-bn0Kk; Thu, 24 Sep 2020 10:25:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB1C086BFF;
	Thu, 24 Sep 2020 10:25:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6F6DC0889;
	Thu, 24 Sep 2020 10:25:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14814C0889
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB1EF86BD0
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVUil6rwDcnT for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:25:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4715E86C34
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600943099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqpAFzoVVNPHoD2su633/m5i0f1o9UijACFpsiH+PwE=;
 b=gAeYoAXCpcVJw2emKtZj4LIah1QhEx1aNZTmQSmyNzXtoljTVvzrKoPPvOH7B0rtV685IY
 gM6rStk8/FVqr8WKSQCMwI1Wt42wijsoIvYRlC9kYU0HYPp1oDjdktn9i6tf1p1L2iHMWU
 r0IGqiKJkCc9Hbs8dcdvZrShtjOkr4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-NGd59hkGNlmhZzSRNxTU6Q-1; Thu, 24 Sep 2020 06:24:55 -0400
X-MC-Unique: NGd59hkGNlmhZzSRNxTU6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C7B21891E87;
 Thu, 24 Sep 2020 10:24:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C33715C1C7;
 Thu, 24 Sep 2020 10:24:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0753A16E0A; Thu, 24 Sep 2020 12:24:46 +0200 (CEST)
Date: Thu, 24 Sep 2020 12:24:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 0/6] Add virtio-iommu built-in topology
Message-ID: <20200924102446.icsdv2yhof4nbnec@sirius.home.kraxel.org>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <ab2a1668-e40c-c8f0-b77b-abadeceb4b82@redhat.com>
 <20200924045958-mutt-send-email-mst@kernel.org>
 <20200924092129.GH27174@8bytes.org>
 <20200924053159-mutt-send-email-mst@kernel.org>
 <20200924100255.GM27174@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924100255.GM27174@8bytes.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, bhelgaas@google.com
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

On Thu, Sep 24, 2020 at 12:02:55PM +0200, Joerg Roedel wrote:
> On Thu, Sep 24, 2020 at 05:38:13AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 24, 2020 at 11:21:29AM +0200, Joerg Roedel wrote:
> > > On Thu, Sep 24, 2020 at 05:00:35AM -0400, Michael S. Tsirkin wrote:
> > > > OK so this looks good. Can you pls repost with the minor tweak
> > > > suggested and all acks included, and I will queue this?
> > > 
> > > My NACK still stands, as long as a few questions are open:
> > > 
> > > 	1) The format used here will be the same as in the ACPI table? I
> > > 	   think the answer to this questions must be Yes, so this leads
> > > 	   to the real question:
> > 
> > I am not sure it's a must.
> 
> It is, having only one parser for the ACPI and MMIO descriptions was one
> of the selling points for MMIO in past discussions and I think it makes
> sense to keep them in sync.

So that requirement basically kills the "we have something to play with
while the acpi table spec is in progress" argument.  Also note that qemu
microvm got acpi support meanwhile.

Are there other cases where neither ACPI nor DT are available?

take care,
  Gerd

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
