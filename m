Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B81388020
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 20:59:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1EF40318;
	Tue, 18 May 2021 18:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDSyEo7DVuzL; Tue, 18 May 2021 18:59:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E04FC402C8;
	Tue, 18 May 2021 18:59:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFA29C001C;
	Tue, 18 May 2021 18:59:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33687C0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D86A60586
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xD-ElHkKboM for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 18:59:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D525460591
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621364342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62kI6pIOIPdtKW8CJ7bGGrK3d5OmdLNd14MdZWiAWKk=;
 b=C9lLPZb7fSNJFwVARtTVQxTl6hlvqvNys02zevgAh8FfkDzCGmpWHC+cgvFl7vqf1tDuBZ
 zrS/Muwwi7wtYP+TZcofUGKA7PP6qMI8g82nIFvHra7nEBhETsCjpl/bViGDSKBtaNSjCi
 dZvuTiT/z/QhOarn6Gk0B9U2MDS8JN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-yWhZ7rJ4PVKo-CwT45TI7Q-1; Tue, 18 May 2021 14:58:58 -0400
X-MC-Unique: yWhZ7rJ4PVKo-CwT45TI7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E3B801106;
 Tue, 18 May 2021 18:58:55 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 730F61037E81;
 Tue, 18 May 2021 18:58:49 +0000 (UTC)
Date: Tue, 18 May 2021 12:58:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v3 7/8] vfio/type1: Add selective DMA faulting support
Message-ID: <20210518125813.7b8a78f1.alex.williamson@redhat.com>
In-Reply-To: <20210409034420.1799-8-lushenming@huawei.com>
References: <20210409034420.1799-1-lushenming@huawei.com>
 <20210409034420.1799-8-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, linux-api@vger.kernel.org,
 wanghaibin.wang@huawei.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 9 Apr 2021 11:44:19 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> Some devices only allow selective DMA faulting. Similar to the selective
> dirty page tracking, the vendor driver can call vfio_pin_pages() to
> indicate the non-faultable scope, we add a new struct vfio_range to
> record it, then when the IOPF handler receives any page request out
> of the scope, we can directly return with an invalid response.

Seems like this highlights a deficiency in the design, that the user
can't specify mappings as iopf enabled or disabled.  Also, if the
vendor driver has pinned pages within the range, shouldn't that prevent
them from faulting in the first place?  Why do we need yet more
tracking structures?  Pages pinned by the vendor driver need to count
against the user's locked memory limits regardless of iopf.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
