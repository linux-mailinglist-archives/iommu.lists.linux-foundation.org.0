Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 413383FC5BF
	for <lists.iommu@lfdr.de>; Tue, 31 Aug 2021 12:38:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83604051B;
	Tue, 31 Aug 2021 10:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmJnjwAIPIha; Tue, 31 Aug 2021 10:37:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0E46840565;
	Tue, 31 Aug 2021 10:37:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9CA2C000E;
	Tue, 31 Aug 2021 10:37:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17E12C000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 097374048D
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7q1JdPNPn0Ye for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 10:37:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB3F240492
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:50 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id u1so6554329plq.5
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNh+cuhjJs3OFS0aHfl+SKfylhnWyvpkdBMP+CFmcGQ=;
 b=cC9RdvfpEZr9j3c/cbFStXaCl2j3V+4M31Y7HIO0JYKKzJajSAk/kH3+/02wcQdoca
 3gjWeLDSoeZ8eVzJciTTuHTn0W+b40Az+LtYVmikSKWrjzUs5vlYUT2AWL33c4Gvg90l
 00lleNTK3W3GmXpkD1tigsSrL+8U9L82s5TB/9lYkKlYQQ9A09ZlwYeq7RCjxrwnUrpc
 Mf1FKxTkF9hsNYiMUzcdN2+fOaHcZ4snE5w9UaUTRCdcZINf+Tbxsqi8j9b95V97RLyP
 5ExLr+ljONAPe4wdkf9WVDzvyI+Ak7U/DbyiPIvD0eXUILDPtot/bxzcpZBnKqYiT3rb
 hcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNh+cuhjJs3OFS0aHfl+SKfylhnWyvpkdBMP+CFmcGQ=;
 b=TZ5QgwvjQQoqMhSH2wQMkJMdaSPWpIY4iMN1jrmMjfaJkTcVFPu3Q2d5rzNUNnGqHK
 CfanoRuZuwYqjp0Bg0e6bqzdd5dg7+SG9o46VMX+ng/+xwSGBbI3rgXLHg6oIB3WlMdc
 1mGPyChyyBwFHQZOI/zZnbO1fOZ+y38LxwvpHG575QjwvBuakB5PO8SpV+yfHvsMQ8CE
 O6/mzWSdvM3Aq4y3ZutfnQe0YVAGFAGoZhBUou7vfLXIO2gUFm5xWGvYfcvLunSaRBNa
 ycDlHYynHK1lxr7L1LHVWxbVc9Be90rLXpEcca9vaMfUyxPclMxOfj/EMa1EgiIZE3yi
 xOlw==
X-Gm-Message-State: AOAM533Q9dPQ7s1WMf3k04jfxyjCn2AqwRwnmaTNoJ3izYo4k41SnuEe
 zcMKqZi4dA7g3XJH0F1HEaAr
X-Google-Smtp-Source: ABdhPJz5ZdYePJ9W7SlMRURLNn+WCedwzK0lYkLxLJnz2MFrrE6yXfiNf5JXlPj6ipxMQMn4nx/s1g==
X-Received: by 2002:a17:90a:9314:: with SMTP id
 p20mr4688064pjo.87.1630406270341; 
 Tue, 31 Aug 2021 03:37:50 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id i24sm6605893pfo.13.2021.08.31.03.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 03:37:49 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com,
 robin.murphy@arm.com, will@kernel.org, john.garry@huawei.com
Subject: [PATCH v13 13/13] Documentation: Add documentation for VDUSE
Date: Tue, 31 Aug 2021 18:36:34 +0800
Message-Id: <20210831103634.33-14-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831103634.33-1-xieyongji@bytedance.com>
References: <20210831103634.33-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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

VDUSE (vDPA Device in Userspace) is a framework to support
implementing software-emulated vDPA devices in userspace. This
document is intended to clarify the VDUSE design and usage.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 Documentation/userspace-api/index.rst |   1 +
 Documentation/userspace-api/vduse.rst | 233 ++++++++++++++++++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 Documentation/userspace-api/vduse.rst

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 0b5eefed027e..c432be070f67 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -27,6 +27,7 @@ place where this information is gathered.
    iommu
    media/index
    sysfs-platform_profile
+   vduse
 
 .. only::  subproject and html
 
diff --git a/Documentation/userspace-api/vduse.rst b/Documentation/userspace-api/vduse.rst
new file mode 100644
index 000000000000..42ef59ea5314
--- /dev/null
+++ b/Documentation/userspace-api/vduse.rst
@@ -0,0 +1,233 @@
+==================================
+VDUSE - "vDPA Device in Userspace"
+==================================
+
+vDPA (virtio data path acceleration) device is a device that uses a
+datapath which complies with the virtio specifications with vendor
+specific control path. vDPA devices can be both physically located on
+the hardware or emulated by software. VDUSE is a framework that makes it
+possible to implement software-emulated vDPA devices in userspace. And
+to make the device emulation more secure, the emulated vDPA device's
+control path is handled in the kernel and only the data path is
+implemented in the userspace.
+
+Note that only virtio block device is supported by VDUSE framework now,
+which can reduce security risks when the userspace process that implements
+the data path is run by an unprivileged user. The support for other device
+types can be added after the security issue of corresponding device driver
+is clarified or fixed in the future.
+
+Create/Destroy VDUSE devices
+------------------------
+
+VDUSE devices are created as follows:
+
+1. Create a new VDUSE instance with ioctl(VDUSE_CREATE_DEV) on
+   /dev/vduse/control.
+
+2. Setup each virtqueue with ioctl(VDUSE_VQ_SETUP) on /dev/vduse/$NAME.
+
+3. Begin processing VDUSE messages from /dev/vduse/$NAME. The first
+   messages will arrive while attaching the VDUSE instance to vDPA bus.
+
+4. Send the VDPA_CMD_DEV_NEW netlink message to attach the VDUSE
+   instance to vDPA bus.
+
+VDUSE devices are destroyed as follows:
+
+1. Send the VDPA_CMD_DEV_DEL netlink message to detach the VDUSE
+   instance from vDPA bus.
+
+2. Close the file descriptor referring to /dev/vduse/$NAME.
+
+3. Destroy the VDUSE instance with ioctl(VDUSE_DESTROY_DEV) on
+   /dev/vduse/control.
+
+The netlink messages can be sent via vdpa tool in iproute2 or use the
+below sample codes:
+
+.. code-block:: c
+
+	static int netlink_add_vduse(const char *name, enum vdpa_command cmd)
+	{
+		struct nl_sock *nlsock;
+		struct nl_msg *msg;
+		int famid;
+
+		nlsock = nl_socket_alloc();
+		if (!nlsock)
+			return -ENOMEM;
+
+		if (genl_connect(nlsock))
+			goto free_sock;
+
+		famid = genl_ctrl_resolve(nlsock, VDPA_GENL_NAME);
+		if (famid < 0)
+			goto close_sock;
+
+		msg = nlmsg_alloc();
+		if (!msg)
+			goto close_sock;
+
+		if (!genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, famid, 0, 0, cmd, 0))
+			goto nla_put_failure;
+
+		NLA_PUT_STRING(msg, VDPA_ATTR_DEV_NAME, name);
+		if (cmd == VDPA_CMD_DEV_NEW)
+			NLA_PUT_STRING(msg, VDPA_ATTR_MGMTDEV_DEV_NAME, "vduse");
+
+		if (nl_send_sync(nlsock, msg))
+			goto close_sock;
+
+		nl_close(nlsock);
+		nl_socket_free(nlsock);
+
+		return 0;
+	nla_put_failure:
+		nlmsg_free(msg);
+	close_sock:
+		nl_close(nlsock);
+	free_sock:
+		nl_socket_free(nlsock);
+		return -1;
+	}
+
+How VDUSE works
+---------------
+
+As mentioned above, a VDUSE device is created by ioctl(VDUSE_CREATE_DEV) on
+/dev/vduse/control. With this ioctl, userspace can specify some basic configuration
+such as device name (uniquely identify a VDUSE device), virtio features, virtio
+configuration space, the number of virtqueues and so on for this emulated device.
+Then a char device interface (/dev/vduse/$NAME) is exported to userspace for device
+emulation. Userspace can use the VDUSE_VQ_SETUP ioctl on /dev/vduse/$NAME to
+add per-virtqueue configuration such as the max size of virtqueue to the device.
+
+After the initialization, the VDUSE device can be attached to vDPA bus via
+the VDPA_CMD_DEV_NEW netlink message. Userspace needs to read()/write() on
+/dev/vduse/$NAME to receive/reply some control messages from/to VDUSE kernel
+module as follows:
+
+.. code-block:: c
+
+	static int vduse_message_handler(int dev_fd)
+	{
+		int len;
+		struct vduse_dev_request req;
+		struct vduse_dev_response resp;
+
+		len = read(dev_fd, &req, sizeof(req));
+		if (len != sizeof(req))
+			return -1;
+
+		resp.request_id = req.request_id;
+
+		switch (req.type) {
+
+		/* handle different types of messages */
+
+		}
+
+		len = write(dev_fd, &resp, sizeof(resp));
+		if (len != sizeof(resp))
+			return -1;
+
+		return 0;
+	}
+
+There are now three types of messages introduced by VDUSE framework:
+
+- VDUSE_GET_VQ_STATE: Get the state for virtqueue, userspace should return
+  avail index for split virtqueue or the device/driver ring wrap counters and
+  the avail and used index for packed virtqueue.
+
+- VDUSE_SET_STATUS: Set the device status, userspace should follow
+  the virtio spec: https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html
+  to process this message. For example, fail to set the FEATURES_OK device
+  status bit if the device can not accept the negotiated virtio features
+  get from the VDUSE_DEV_GET_FEATURES ioctl.
+
+- VDUSE_UPDATE_IOTLB: Notify userspace to update the memory mapping for specified
+  IOVA range, userspace should firstly remove the old mapping, then setup the new
+  mapping via the VDUSE_IOTLB_GET_FD ioctl.
+
+After DRIVER_OK status bit is set via the VDUSE_SET_STATUS message, userspace is
+able to start the dataplane processing as follows:
+
+1. Get the specified virtqueue's information with the VDUSE_VQ_GET_INFO ioctl,
+   including the size, the IOVAs of descriptor table, available ring and used ring,
+   the state and the ready status.
+
+2. Pass the above IOVAs to the VDUSE_IOTLB_GET_FD ioctl so that those IOVA regions
+   can be mapped into userspace. Some sample codes is shown below:
+
+.. code-block:: c
+
+	static int perm_to_prot(uint8_t perm)
+	{
+		int prot = 0;
+
+		switch (perm) {
+		case VDUSE_ACCESS_WO:
+			prot |= PROT_WRITE;
+			break;
+		case VDUSE_ACCESS_RO:
+			prot |= PROT_READ;
+			break;
+		case VDUSE_ACCESS_RW:
+			prot |= PROT_READ | PROT_WRITE;
+			break;
+		}
+
+		return prot;
+	}
+
+	static void *iova_to_va(int dev_fd, uint64_t iova, uint64_t *len)
+	{
+		int fd;
+		void *addr;
+		size_t size;
+		struct vduse_iotlb_entry entry;
+
+		entry.start = iova;
+		entry.last = iova;
+
+		/*
+		 * Find the first IOVA region that overlaps with the specified
+		 * range [start, last] and return the corresponding file descriptor.
+		 */
+		fd = ioctl(dev_fd, VDUSE_IOTLB_GET_FD, &entry);
+		if (fd < 0)
+			return NULL;
+
+		size = entry.last - entry.start + 1;
+		*len = entry.last - iova + 1;
+		addr = mmap(0, size, perm_to_prot(entry.perm), MAP_SHARED,
+			    fd, entry.offset);
+		close(fd);
+		if (addr == MAP_FAILED)
+			return NULL;
+
+		/*
+		 * Using some data structures such as linked list to store
+		 * the iotlb mapping. The munmap(2) should be called for the
+		 * cached mapping when the corresponding VDUSE_UPDATE_IOTLB
+		 * message is received or the device is reset.
+		 */
+
+		return addr + iova - entry.start;
+	}
+
+3. Setup the kick eventfd for the specified virtqueues with the VDUSE_VQ_SETUP_KICKFD
+   ioctl. The kick eventfd is used by VDUSE kernel module to notify userspace to
+   consume the available ring. This is optional since userspace can choose to poll the
+   available ring instead.
+
+4. Listen to the kick eventfd (optional) and consume the available ring. The buffer
+   described by the descriptors in the descriptor table should be also mapped into
+   userspace via the VDUSE_IOTLB_GET_FD ioctl before accessing.
+
+5. Inject an interrupt for specific virtqueue with the VDUSE_INJECT_VQ_IRQ ioctl
+   after the used ring is filled.
+
+For more details on the uAPI, please see include/uapi/linux/vduse.h.
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
