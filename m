Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BC890C7
	for <lists.iommu@lfdr.de>; Sun, 11 Aug 2019 10:55:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E52D5B2F;
	Sun, 11 Aug 2019 08:55:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BE2B1AE0
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA2A1786
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:55:34 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b11so253098qtp.10
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 01:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=6/2qVAPvLy768Na8XqJHyfaQBOmu1VTQjHr1b0tqDos=;
	b=DYQRp8PTbmxFHl5c+jdAvcUrUIFqmhE1vSeEVNTo+45a/5YybV6PsOafMbOJM9Em0f
	rWwJp9PhCIqA/GOocy5l70B7/Obp8aMr9UAiN81jCcNrJGSMU64BOh5mDZrH3azGz+Ec
	kWUdQ7YV9O0vaRnQ3jhWg3vBeBNUHZZc1Yei/XiZnfWrleISdNo3V+9st60wdyeSarGF
	jnGhARh17qzSK+h1X9433MgKoMBMoqKPGpDo07QxbxgLpuRS4APM5ii4lBrDvGyhJhMq
	tk3RATAkKBLthKvk+4cJUwDjyci4WQUNsacksuYci7y7I6dj/0jt2UvebK4qCOE040Md
	33QQ==
X-Gm-Message-State: APjAAAX2YqyRsY0xMQK7mPX9QuHRhBiuaD5Ez4IDhXEZBtTPq5j63mB2
	pxIeDZ9Ma5ws8Uliinpl8J3NjA==
X-Google-Smtp-Source: APXvYqwQSHWl5DZCKxcv6b09e+m/U60yeBUP2tSK+Zxbso+cleqVM/RZ1b43sqdRDBiAuYOyKuC1mA==
X-Received: by 2002:a0c:d91b:: with SMTP id p27mr25451190qvj.236.1565513734175;
	Sun, 11 Aug 2019 01:55:34 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	x26sm3314318qkn.116.2019.08.11.01.55.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 01:55:33 -0700 (PDT)
Date: Sun, 11 Aug 2019 04:55:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811044431-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811055607.GA12488@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jason Wang <jasowang@redhat.com>, Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	David Gibson <david@gibson.dropbear.id.au>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Sun, Aug 11, 2019 at 07:56:07AM +0200, Christoph Hellwig wrote:
> So we need a flag on the virtio device, exposed by the
> hypervisor (or hardware for hw virtio devices) that says:  hey, I'm real,
> don't take a shortcut.

The point here is that it's actually still not real. So we would still
use a physical address. However Linux decides that it wants extra
security by moving all data through the bounce buffer.  The distinction
made is that one can actually give device a physical address of the
bounce buffer.

-- 
MST
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
