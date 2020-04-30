Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CB1BF5F7
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 12:57:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 473F623E6B;
	Thu, 30 Apr 2020 10:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhUcGDkeiR+x; Thu, 30 Apr 2020 10:57:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E126520508;
	Thu, 30 Apr 2020 10:57:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA56BC016F;
	Thu, 30 Apr 2020 10:57:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5319CC016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 10:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D74387E08
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 10:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljmhgATuglwm for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:57:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA7B187DDD
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588244232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPTO/eyQP/GDrnFIvbjLZMErvY47uLWxT14ZRU2nJfE=;
 b=MwNDaqRX3UPiuT0B4PPN5c0VdVxw49XGN+DaZjX+bs321eDh0eKMFFloTmSOGcGSQoi2+5
 n9Fw+CcVxxAQl/ixRWH0SVUpkhM70IoN4JiZSSbbVjdneHJtW1Qk6tx20QT9nPRWFsKD8Q
 YKT9wEC89yL2NeK5+YO1XBUMDvxhvBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-H3OXSUQEOrqBPQWwCQm_HQ-1; Thu, 30 Apr 2020 06:57:08 -0400
X-MC-Unique: H3OXSUQEOrqBPQWwCQm_HQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8171895A2A;
 Thu, 30 Apr 2020 10:57:06 +0000 (UTC)
Received: from [10.72.13.175] (ovpn-13-175.pek2.redhat.com [10.72.13.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562DD1C950;
 Thu, 30 Apr 2020 10:56:59 +0000 (UTC)
Subject: Re: [RFC/PATCH 0/1] virtio_mmio: hypervisor specific interfaces for
 MMIO
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
 <20200430060653-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <49422625-add9-a13a-6a29-cf761be4cb3a@redhat.com>
Date: Thu, 30 Apr 2020 18:56:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430060653-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, alex.bennee@linaro.org,
 iommu@lists.linux-foundation.org, stefano.stabellini@xilinx.com,
 will@kernel.org, linux-kernel@vger.kernel.org, pratikp@codeaurora.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8zMCDkuIvljYg2OjA3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMzAsIDIwMjAgYXQgMDM6MzI6NTVQTSArMDUzMCwgU3JpdmF0c2EgVmFkZGFnaXJp
IHdyb3RlOgo+PiBUaGUgVHlwZS0xIGh5cGVydmlzb3Igd2UgYXJlIGRlYWxpbmcgd2l0aCBkb2Vz
IG5vdCBhbGxvdyBmb3IgTU1JTyB0cmFuc3BvcnQuCj4gSG93IGFib3V0IFBDSSB0aGVuPwoKCk9y
IG1heWJlIHlvdSBjYW4gdXNlIHZpcnRpby12ZHBhLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
